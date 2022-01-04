import {firestore} from "firebase-admin";
import * as functions from "firebase-functions";
import { database } from ".";
import { checkAuthentication } from "./auth";

export const USERS = "users";
export const USERNAME = "userName";
export interface User extends firestore.DocumentData {
  createdAt: FirebaseFirestore.Timestamp;
  imageUrl: string;
  updatedAt: FirebaseFirestore.Timestamp;
  userName: string;
  token: string | undefined;
}

export async function getUserDocument(id: string) {
  return database
    .collection(USERS)
    .doc(id)
    .get()
    .then((snapshot) => {
      if (!snapshot.exists) {
        throw new functions.https.HttpsError("not-found", "User not found.");
      }
      return snapshot.data() as User;
    });
}

export const updateUserName = functions
  .region("europe-west3")
  .https.onCall(async (data, context) => {
    checkAuthentication(context);

    const uid = context.auth!.uid;

    const userName = data.userName;

    const userNameAlreadyExists = await database
      .collection(USERS)
      .where(USERNAME, "==", userName)
      .get()
      .then((snapshot) => snapshot.size > 0);

    if (userNameAlreadyExists) {
      console.error(
        `Updating 'userName' of ${uid} failed: 'userName' already exists.`
      );
      throw new functions.https.HttpsError(
        "already-exists",
        "Username already exists."
      );
    }
    console.log(`Updating 'userName' of ${uid}`);
    return await database.collection(USERS).doc(uid).update({
      userName,
    });
  });

export const updateTimestamp = functions
  .region("europe-west3")
  .firestore.document(`${USERS}/{userId}`)
  .onUpdate(async (change, context) => {
    const uid = change.before.ref.id;
    const before: User = change.before.data() as User;
    const after: User = change.after.data() as User;
    if (before.updatedAt.isEqual(after.updatedAt)) {
      console.log(
        `Updating 'updatedAt' timestamp for User Document of ${uid}...`
      );
      return await change.after.ref.update({
        updatedAt: change.after.updateTime,
      });
    }
    console.log("Timestamp up-to-date.");
    await Promise.resolve();
    return;
  });
