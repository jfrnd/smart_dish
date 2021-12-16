import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@prod
@module
abstract class FirebaseInjectableModuleProd {
  @prod
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @prod
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  @prod
  @lazySingleton
  FirebaseStorage get storage => FirebaseStorage.instance;
  @prod
  @lazySingleton
  FirebaseFunctions get functions =>
      FirebaseFunctions.instanceFor(region: "europe-west3");
}

@dev
@module
abstract class FirebaseInjectableModuleDev {
  @dev
  @lazySingleton
  FirebaseAuth get firebaseAuth {
    final auth = FirebaseAuth.instance;
    auth.useAuthEmulator("localhost", 9099);
    // auth.signInWithEmailAndPassword(email: "jan@test.de", password: "lol123");
    return auth;
  }

  @dev
  @lazySingleton
  FirebaseFirestore get firestore {
    final firestore = FirebaseFirestore.instance;
    firestore.useFirestoreEmulator("localhost", 8080);
    return firestore;
  }

  @dev
  @lazySingleton
  FirebaseStorage get storage {
    final storage = FirebaseStorage.instance;
    storage.useStorageEmulator("localhost", 9199);
    return storage;
  }

  @dev
  @lazySingleton
  FirebaseFunctions get functions {
    final functions = FirebaseFunctions.instanceFor(region: "europe-west3");
    functions.useFunctionsEmulator("localhost", 5001);
    return functions;
  }
}
