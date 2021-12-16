import * as admin from "firebase-admin";
import { METADATA } from "./consts";

export interface MetaData extends admin.firestore.DocumentData {
  updatedAt: FirebaseFirestore.Timestamp;
  createdAt: FirebaseFirestore.Timestamp;
  createdBy: string;
  updatedBy: string;
}

export function createMetaData(path: string, userId: string) {
  const metaData: MetaData = {
    createdAt: admin.firestore.Timestamp.now(),
    updatedAt: admin.firestore.Timestamp.now(),
    createdBy: userId,
    updatedBy: userId,
  };

  return admin
    .firestore()
    .doc(path)
    .collection(METADATA)
    .doc(METADATA)
    .set(metaData);
}
