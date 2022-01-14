import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import { HOUSEHOLDS } from "./consts";

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
    return addMetaData(snapshot);
  });

async function addMetaData(
  snapshot: functions.firestore.QueryDocumentSnapshot
): Promise<firestore.WriteResult> {
  return snapshot.ref.update({
    createdAt: firestore.Timestamp.now(),
    updatedAt: firestore.Timestamp.now(),
  });
}
