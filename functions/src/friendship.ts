import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import { database } from ".";
import { checkAuthentication } from "./auth";
import { FRIENDSHIPS } from "./consts";
import { getUserDocument, User } from "./user_doc";

export interface FriendShip extends firestore.DocumentData {
  createdAt: FirebaseFirestore.Timestamp;
  users: string[];
}

export function createFriendShip(id1: string, id2: string) {
  const uniqueOrder = [id1, id2].sort();

  const friendShip: FriendShip = {
    users: [uniqueOrder[0], uniqueOrder[1]],
    createdAt: firestore.Timestamp.now(),
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
  const friendships = await database
    .collection(FRIENDSHIPS)
    .where("users", "array-contains", id)
    .get()
    .then((snapshot) => snapshot.docs.map((doc) => doc.data() as FriendShip));

  const friendsIds = friendships.map(
    (friendship) => friendship.users.filter((userId) => userId != id)[0]
  );

  const friends: User[] = [];
  const jobs: Promise<any>[] = [];

  friendsIds.forEach(async (id) => {
    const job = getUserDocument(id).then((doc) => friends.push(doc));
    jobs.push(job);
  });
  return Promise.all(jobs).then((_) => friends);
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
