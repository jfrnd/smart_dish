import { storage, firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import { DISHES } from "./consts";
import { getFriendsOfUser } from "./friendship";
import { sendPushNotificationToUser } from "./push_notification";
import { getUserDocument } from "./user_doc";

export interface Dish {
  name: string;
  imageUrl: string;
  createdBy: string;
  createdAt: FirebaseFirestore.Timestamp;
  updatedAt: FirebaseFirestore.Timestamp;
  ingredients: string[];
}

export const onUpdateDish = functions
  .region("europe-west3")
  .firestore.document(`${DISHES}/{dishId}`)
  .onUpdate(async (change, context) => {
    const before: Dish = change.before.data() as Dish;
    const after: Dish = change.after.data() as Dish;
    if (before.updatedAt.isEqual(after.updatedAt)) {
      return change.after.ref.update({
        updatedAt: firestore.Timestamp.now(),
      });
    }
    return;
  });

export const onCreateDish = functions
  .region("europe-west3")
  .firestore.document(`${DISHES}/{dishId}`)
  .onCreate(async (snapshot, context) => {
    await sendPushNotifictaionToFriends(snapshot);
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

async function sendPushNotifictaionToFriends(
  snapshot: functions.firestore.QueryDocumentSnapshot
) {
  const dish = snapshot.data() as Dish;
  const jobs: Promise<any>[] = [];
  const creator = await getUserDocument(dish.createdBy);
  const friends = await getFriendsOfUser(dish.createdBy);

  friends.forEach(async (user) => {
    const job = sendPushNotificationToUser(
      user,
      "New dish created",
      `${creator.userName} created a new dish: ${dish.name}.`,
      dish.imageUrl == "" ? creator.imageUrl : dish.imageUrl
    );
    jobs.push(job);
  });
  await Promise.all(jobs);
}

export const onDeleteDish = functions
  .region("europe-west3")
  .firestore.document(`${DISHES}/{dishId}`)
  .onDelete(async (snapshot, context) => {
    return deleteDishPicture(snapshot);
  });

function deleteDishPicture(
  snapshot: functions.firestore.QueryDocumentSnapshot
) {
  const dish: Dish = snapshot.data() as Dish;

  const bucket = storage().bucket();

  const path = `${dish.createdBy}/dishes/${snapshot.id}`;

  return bucket.file(path).delete();
}
