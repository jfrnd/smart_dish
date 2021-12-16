import admin = require("firebase-admin");

import { FRIENDSHIPS, FRIEND_REQUESTS, METADATA, DISHES } from "./consts";
import { FriendShip } from "./friendship";
import { FriendRequest } from "./friend_request";
import { Dish } from "./dish";

// initialization;
const projectId = "smartdish-82118";
process.env.FIRESTORE_EMULATOR_HOST = "localhost:8080";
admin.initializeApp({ projectId });

const database = admin.firestore();
database.settings({ ignoreUndefinedProperties: true });

async function seedFriendship(id1: string, id2: string) {
  const uniqueOrder = [id1.toUpperCase(), id2.toUpperCase()].sort();
  const docId = uniqueOrder[0] + "__" + uniqueOrder[1];
  const friendship: FriendShip = {
    users: [id1.toUpperCase(), id2.toUpperCase()],
    createdAt: admin.firestore.Timestamp.now(),
  };
  await database.collection(FRIENDSHIPS).doc(docId).set(friendship);
}

async function seedFriendrequest(senderName: string, receiverName: string) {
  const senderImageUrl = await database
    .collection("users")
    .doc(senderName.toUpperCase())
    .get()
    .then((doc) => doc.data()!["imageUrl"]);

  const receiverImageUrl = await database
    .collection("users")
    .doc(receiverName.toUpperCase())
    .get()
    .then((doc) => doc.data()!["imageUrl"]);

  const friendRequest: FriendRequest = {
    accepted: null,
    senderId: senderName.toUpperCase(),
    senderName: senderName,
    senderImageUrl: senderImageUrl,
    receiverId: receiverName.toUpperCase(),
    receiverName: receiverName,
    receiverImageUrl: receiverImageUrl,
    createdAt: admin.firestore.Timestamp.now(),
  };

  await database
    .collection(FRIEND_REQUESTS)
    .doc(`${senderName.toUpperCase()}__${receiverName.toUpperCase()}`)
    .set(friendRequest);
}

async function seedFriends() {
  try {
    const batch = database.batch();

    const friendships = await database.collection(FRIENDSHIPS).get();
    friendships.forEach(async (doc) => {
      batch.delete(doc.ref);
    });

    const friendRequests = await database.collection(FRIEND_REQUESTS).get();
    friendRequests.forEach(async (doc) => {
      batch.delete(doc.ref);
    });

    await batch.commit();

    await seedFriendship("jan", "lilly");
    await seedFriendship("jan", "marshall");
    await seedFriendrequest("jan", "robin");
    await seedFriendrequest("jan", "ted");
    await seedFriendrequest("dan", "jan");
    await seedFriendrequest("barney", "jan");

    console.log("friends seed was successful");
  } catch (error) {
    console.log(error, "friends seed failed");
  }
}

async function seedDish(name: string, imageUrl: string, createdBy: string) {
  const dish: Dish = {
    createdBy: createdBy,
    name: name,
    imageUrl: imageUrl,
    createdAt: admin.firestore.Timestamp.now(),
    updatedAt: admin.firestore.Timestamp.now(),
  };

  return await admin
    .firestore()
    .collection(DISHES)
    .doc(name.toUpperCase())
    .create(dish);
}

async function seedDishes() {
  try {
    const batch = database.batch();

    const expenses = await database.collection(DISHES).get();
    expenses.forEach(async (doc) => {
      batch.delete(doc.ref);
      batch.delete(doc.ref.collection(METADATA).doc(METADATA));
    });

    await batch.commit();

    await seedDish("Spaghetti aglio e olio", "", "TED");
    await seedDish("Penne all'Arrabbiata", "", "TED");
    await seedDish("Greek salad", "", "BARNEY");
    await seedDish("Bolognese", "", "LILLY");
    await seedDish("Chili con carne", "", "MARSHALL");
    await seedDish("Duck", "", "ROBIN");

    console.log("dishes seed was successful");
  } catch (error) {
    console.log(error, "dishes seed failed");
  }
}

async function seedData() {
  await seedFriends();
  await seedDishes();
}

seedData();
