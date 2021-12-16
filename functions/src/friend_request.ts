import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import { database } from ".";
import { checkAuthentication } from "./auth";
import { FRIEND_REQUESTS } from "./consts";
import { createFriendShip, friendshipDoesNotExist } from "./friendship";
import { getUserDocument } from "./user_doc";

export interface FriendRequest extends admin.firestore.DocumentData {
  createdAt: FirebaseFirestore.Timestamp;
  senderId: string;
  senderName: string;
  senderImageUrl: string;
  receiverId: string;
  receiverName: string;
  receiverImageUrl: string;
  accepted: boolean | null;
}

async function friendRequestDoesNotExist(senderId: string, receiverId: string) {
  return database
    .collection(FRIEND_REQUESTS)
    .doc(senderId + "__" + receiverId)
    .get()
    .then((snapshot) => {
      if (snapshot.exists) {
        throw new functions.https.HttpsError(
          "already-exists",
          "There is already a pending friend request."
        );
      } else {
        return true;
      }
    });
}

async function receiverHasAlreadySentRequest(
  senderId: string,
  receiverId: string
) {
  return database
    .collection(FRIEND_REQUESTS)
    .doc(receiverId + "__" + senderId)
    .get()
    .then(async (snapshot) => {
      if (snapshot.exists) {
        await snapshot.ref.delete();
        return true;
      } else {
        return false;
      }
    });
}

interface SendFriendRequestPayload {
  userId: string;
}

export const send = functions
  .region("europe-west3")
  .https.onCall(async (data: SendFriendRequestPayload, context) => {
    checkAuthentication(context);

    const receiverId = data.userId;
    const senderId = context.auth!.uid;

    if (receiverId == senderId) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Cannot add yourself as a friend."
      );
    }

    if (await receiverHasAlreadySentRequest(senderId, receiverId)) {
      return createFriendShip(senderId, receiverId);
    }

    if (
      (await friendRequestDoesNotExist(senderId, receiverId)) &&
      (await friendshipDoesNotExist(senderId, receiverId))
    ) {
      const sender = await getUserDocument(senderId);
      const receiver = await getUserDocument(receiverId);

      const friendRequest: FriendRequest = {
        createdAt: admin.firestore.Timestamp.now(),
        receiverId: receiverId,
        receiverName: receiver.userName,
        receiverImageUrl: receiver.imageUrl,
        senderId: senderId,
        senderName: sender.userName,
        senderImageUrl: sender.imageUrl,
        accepted: null,
      };

      return database
        .collection(FRIEND_REQUESTS)
        .doc(senderId + "__" + receiverId)
        .set(friendRequest);
    }
    return;
  });

export const onConfirmFriendRequest = functions
  .region("europe-west3")
  .firestore.document(`${FRIEND_REQUESTS}/{requestId}`)
  .onUpdate(async (change, context) => {
    const before: FriendRequest = change.before.data() as FriendRequest;
    const after: FriendRequest = change.after.data() as FriendRequest;
    if (before.accepted != after.accepted) {
      if (after.accepted == true) {
        console.log(`FriendRequest ${change.before.id} accepted.`);
        console.log(`Creating Friendship ${change.before.id}...`);
        await createFriendShip(after.senderId, after.receiverId);
        console.log(`Deleting FriendRequest ${change.before.id}...`);
        return change.after.ref.delete();
      }
      if (after.accepted == false) {
        console.log(`FriendRequest ${change.before.id} denied.`);
        console.log(`Deleting FriendRequest ${change.before.id}...`);
        return change.after.ref.delete();
      }
    }
    return;
  });
