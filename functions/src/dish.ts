import * as admin from "firebase-admin";
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
}

export const onUpdateDish = functions
  .region("europe-west3")
  .firestore.document(`${DISHES}/{dishId}`)
  .onUpdate(async (change, context) => {
    const before: Dish = change.before.data() as Dish;
    const after: Dish = change.after.data() as Dish;
    if (before.updatedAt.isEqual(after.updatedAt)) {
      return change.after.ref.update({
        updatedAt: admin.firestore.Timestamp.now(),
      });
    }
    return;
  });

export const onCreateDish = functions
  .region("europe-west3")
  .firestore.document(`${DISHES}/{dishId}`)
  .onCreate(async (snapshot, context) => {
    const dish = snapshot.data() as Dish;
    const creator = await getUserDocument(dish.createdBy);
    const friends = await getFriendsOfUser(dish.createdBy);

    const jobs: Promise<any>[] = [];
    friends.forEach(async (user) => {
      if (user.token != undefined && user.token != "") {
        const job = sendPushNotificationToUser(
          user.token,
          "New dish created",
          `${creator.userName} created a new dish: ${dish.name}.`,
          creator.imageUrl
        );
        jobs.push(job);
      }
    });
    await Promise.all(jobs);

    return snapshot.ref.update({
      createdAt: admin.firestore.Timestamp.now(),
      updatedAt: admin.firestore.Timestamp.now(),
    });
  });

export const onDeleteDish = functions
  .region("europe-west3")
  .firestore.document(`${DISHES}/{dishId}`)
  .onDelete(async (snapshot, context) => {
    const dish: Dish = snapshot.data() as Dish;

    const bucket = admin.storage().bucket();

    const path = `${dish.createdBy}/dishes/${snapshot.id}`;

    return bucket.file(path).delete();
  });
