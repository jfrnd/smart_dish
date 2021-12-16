import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import { database } from ".";
import { checkAuthentication } from "./auth";
import { FRIENDSHIPS } from "./consts";

export interface FriendShip extends admin.firestore.DocumentData {
  createdAt: FirebaseFirestore.Timestamp;
  users: string[];
}

export function createFriendShip(id1: string, id2: string) {
  const uniqueOrder = [id1, id2].sort();

  const friendShip: FriendShip = {
    users: [uniqueOrder[0], uniqueOrder[1]],
    createdAt: admin.firestore.Timestamp.now(),
  };

  const batch = database.batch();

  const docId = uniqueOrder[0] + "__" + uniqueOrder[1];

  batch.create(database.collection(FRIENDSHIPS).doc(docId), friendShip);

  return batch.commit();
}

export async function friendshipDoesNotExist(id1: string, id2: string) {
  const uniqueOrder = [id1, id2].sort();
  const docId = uniqueOrder[0] + "__" + uniqueOrder[1];

  return database
    .collection(FRIENDSHIPS)
    .doc(docId)
    .get()
    .then((snapshot) => {
      if (snapshot.exists) {
        throw new functions.https.HttpsError(
          "already-exists",
          "You are already friends."
        );
      } else {
        return true;
      }
    });
}

export async function getFriendsOfUser(id: string) {
  const query1 = await database
    .collection(FRIENDSHIPS)
    .where("user1", "==", id)
    .get();
  const query2 = await database
    .collection(FRIENDSHIPS)
    .where("user2", "==", id)
    .get();
  const friendIds: string[] = [];
  query1.docs.forEach((doc) =>
    friendIds.push((doc.data() as FriendShip).user2)
  );
  query2.docs.forEach((doc) =>
    friendIds.push((doc.data() as FriendShip).user1)
  );
  return friendIds;
}

interface DeleteFriendshipPayload {
  userId: string;
}

export const deleteFriendShip = functions
  .region("europe-west3")
  .https.onCall(async (data: DeleteFriendshipPayload, context) => {
    checkAuthentication(context);

    const userId = data.userId;
    const senderId = context.auth!.uid;
    const uniqueOrder = [userId, senderId].sort();
    const docId = uniqueOrder[0] + "__" + uniqueOrder[1];

    return database.collection(FRIENDSHIPS).doc(docId).delete();
  });
