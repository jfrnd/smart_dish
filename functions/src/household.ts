import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import { HOUSEHOLDS } from "./consts";
import { sendPushNotificationToUser } from "./push_notification";
import { getUserDocument } from "./user_doc";

export interface Household extends firestore.DocumentData {
  createdAt: FirebaseFirestore.Timestamp;
  createdBy: string;
  updatedAt: FirebaseFirestore.Timestamp;
  updatedBy: string;
  name: string;
  imageUrl: string;
  members: string[];
  admins: string[];
}

export const onUpdateHousehold = functions
  .region("europe-west3")
  .firestore.document(`${HOUSEHOLDS}/{householdId}`)
  .onUpdate(async (change, context) => {
    const before: Household = change.before.data() as Household;
    const after: Household = change.after.data() as Household;

    if (before.members != after.members) {
      await sendPushNotificationToNewMembers(after, before);
    }

    if (before.updatedAt.isEqual(after.updatedAt)) {
      return change.after.ref.update({
        updatedAt: firestore.Timestamp.now(),
      });
    }
    return;
  });

export const onCreateHousehold = functions
  .region("europe-west3")
  .firestore.document(`${HOUSEHOLDS}/{householdId}`)
  .onCreate(async (snapshot, context) => {
    const household: Household = snapshot.data() as Household;

    await sendPushNotificationToInvitedMembers(household);

    return addMetaData(snapshot);
  });

async function sendPushNotificationToInvitedMembers(household: Household) {
  const jobs: Promise<any>[] = [];

  household.members.forEach(async (userId, _) => {
    if (userId != household.createdBy) {
      const user = await getUserDocument(userId);
      const job = sendPushNotificationToUser(
        user,
        "New Household",
        `You are now part of ${household.name}.`,
        user.imageUrl
      );
      jobs.push(job);
    }
  });

  await Promise.all(jobs);
}

async function sendPushNotificationToNewMembers(
  after: Household,
  before: Household
) {
  const jobs: Promise<any>[] = [];
  after.members.forEach(async (userId, _) => {
    if (!before.members.includes(userId)) {
      const user = await getUserDocument(userId);
      const job = sendPushNotificationToUser(
        user,
        "New Household",
        `You are now part of ${after.name}.`,
        after.imageUrl
      );
      jobs.push(job);
    }
  });
  await Promise.all(jobs);
}

async function addMetaData(
  snapshot: functions.firestore.QueryDocumentSnapshot
): Promise<firestore.WriteResult> {
  return snapshot.ref.update({
    createdAt: firestore.Timestamp.now(),
    updatedAt: firestore.Timestamp.now(),
  });
}
