// import { storage, firestore } from "firebase-admin";
// import * as functions from "firebase-functions";
// import { DISHES } from "./consts";
// import { getFriendsOfUser } from "./friendship";
// import { sendPushNotificationToUser } from "./push_notification";
// import { getUserDocument } from "./user_doc";

export interface Meal {
  householdId: string;
  dishId: string;
  time: FirebaseFirestore.Timestamp;
  changedBy: string;
  changedAt: FirebaseFirestore.Timestamp;
}
