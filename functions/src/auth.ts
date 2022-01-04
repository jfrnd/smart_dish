import { firestore, storage } from "firebase-admin";
import * as functions from "firebase-functions";
import { v4 as uuidv4 } from "uuid";
import { database } from ".";
import { USERNAME, USERS } from "./user_doc";

export const onCreateUser = functions
  .region("europe-west3")
  .auth.user()
  .onCreate(async (user) => {
    let userName = user.email?.slice(0, user.email?.indexOf("@"));
    const alreadyExists = await database
      .collection(USERS)
      .where(USERNAME, "==", userName)
      .get()
      .then((snapshot) => snapshot.size > 0);
    if (alreadyExists) userName = userName + "-" + uuidv4().substring(0, 9);
    return database.collection(USERS).doc(user.uid).set(
      {
        userName: userName,
        createdAt: firestore.Timestamp.now(),
        updatedAt: firestore.Timestamp.now(),
        imageUrl: "",
      },
      { merge: false }
    );
  });

export const onDeleteUser = functions
  .region("europe-west3")
  .auth.user()
  .onDelete(async (user) => {
    const bucket = storage().bucket();

    const path = `${user.uid}/userImage`;

    await database.collection(USERS).doc(user.uid).delete();
    return bucket.file(path).delete();
  });

export function checkAuthentication(context: functions.https.CallableContext) {
  if (context.auth == null) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Not authenticated."
    );
  }
}
