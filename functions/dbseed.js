const admin = require("firebase-admin");

// initialization
const projectId = "smartcash-574ce";
process.env.FIRESTORE_EMULATOR_HOST = "localhost:8080";
admin.initializeApp({ projectId });

const database = admin.firestore();

// seed function
function seedFriendShips() {
  database.collection("friendships").doc("JAN__DAN").set({
    user1: "JAN",
    user2: "DAN",
    createdAt: admin.firestore.Timestamp.now(),
  });

  try {
    console.log("database seed was successful");
  } catch (error) {
    console.log(error, "database seed failed");
  }
}

seedFriendShips();
