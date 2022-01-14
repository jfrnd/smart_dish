import * as admin from "firebase-admin";

admin.initializeApp();

export const database = admin.firestore();
database.settings({ ignoreUndefinedProperties: true });

export import friendRequest = require("./friend_request");
export import friendship = require("./friendship");
export import household = require("./household");
export import meal = require("./meal");
export import userDoc = require("./user_doc");
export import authTrigger = require("./auth");
export import dish = require("./dish");
