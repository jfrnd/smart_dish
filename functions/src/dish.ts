import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import { DISHES } from "./consts";

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
