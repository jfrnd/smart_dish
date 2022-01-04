import { firestore } from "firebase-admin";
import { METADATA } from "./consts";

export interface MetaData extends firestore.DocumentData {
  updatedAt: FirebaseFirestore.Timestamp;
  createdAt: FirebaseFirestore.Timestamp;
  createdBy: string;
  updatedBy: string;
}

export function createMetaData(path: string, userId: string) {
  const metaData: MetaData = {
    createdAt: firestore.Timestamp.now(),
    updatedAt: firestore.Timestamp.now(),
    createdBy: userId,
    updatedBy: userId,
  };

  return firestore().doc(path).collection(METADATA).doc(METADATA).set(metaData);
}
