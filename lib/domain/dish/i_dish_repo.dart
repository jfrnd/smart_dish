// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/standard.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/user/user_extended_data.dart';
import 'package:smart_dish/domain/watcher/i_watcher_repo.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import 'dish.dart';

const DISHES = "dishes";

abstract class IDishRepo implements IWatcherRepo<List<Dish>> {
  Future<Either<CrudFailure, Unit>> createDish(Dish dish, Uint8List? image);
  Future<Either<CrudFailure, Unit>> updateDish(Dish dish, Uint8List? image);
  Future<Either<CrudFailure, Unit>> deleteDish(Dish dish);
  Stream<Either<CrudFailure, List<Dish>>> watchDishes(List<User> users);
}

@LazySingleton(as: IDishRepo)
class FirebaseDishRepo implements IDishRepo {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final IAuthRepo _authRepo;

  FirebaseDishRepo(
    this._firestore,
    this._authRepo,
    this._storage,
  );

  @override
  Stream<Either<CrudFailure, List<Dish>>> watchAll() async* {
    throw NotImplementedException();
  }

  @override
  Future<Either<CrudFailure, Unit>> createDish(
      Dish dish, Uint8List? image) async {
    final userId = await _authRepo.getUserId();
    String imageUrl = "";
    final String uid = const Uuid().v1();

    try {
      if (image != null) {
        await _storage
            .ref()
            .child(userId)
            .child(DISHES)
            .child(uid)
            .putData(image, SettableMetadata(contentType: "image/jpeg"));

        imageUrl = await _storage
            .ref()
            .child(userId)
            .child(DISHES)
            .child(uid)
            .getDownloadURL();
      }

      await _firestore.collection(DISHES).doc(uid).set(dish
          .copyWith(
            createdBy: userId,
            imageUrl: imageUrl,
          )
          .toFirestore());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CrudFailure.firebase(e.message ?? "Unknown error."));
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> updateDish(
      Dish dish, Uint8List? image) async {
    final userId = await _authRepo.getUserId();

    String imageUrl = dish.imageUrl;
    try {
      if (image != null) {
        await _storage
            .ref()
            .child(userId)
            .child(DISHES)
            .child(dish.id!)
            .putData(image, SettableMetadata(contentType: "image/jpeg"));

        imageUrl = await _storage
            .ref()
            .child(userId)
            .child(DISHES)
            .child(dish.id!)
            .getDownloadURL();
      }

      await _firestore
          .collection(DISHES)
          .doc(dish.id)
          .update(dish.copyWith(imageUrl: imageUrl).toFirestore());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CrudFailure.firebase(e.message ?? "Unknown error."));
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> deleteDish(Dish dish) async {
    try {
      await _firestore.collection(DISHES).doc(dish.id).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CrudFailure.firebase(e.message ?? "Unknown error."));
    }
  }

  @override
  Stream<Either<CrudFailure, List<Dish>>> watchDishes(List<User> users) async* {
    final userId = await _authRepo.getUserId();
    final userIds = users.map((e) => e.id!).toList();
    yield* _firestore
        .collection(DISHES)
        .where("createdBy", whereIn: userIds)
        .orderBy("updatedAt", descending: true)
        .withConverter<Dish>(
          fromFirestore: (snapshot, options) {
            final dish = Dish.fromFirestore(snapshot, options);
            final user = users.firstWhere((user) => user.id! == dish.createdBy,
                orElse: () => User.empty());
            final userExtendedData = UserExtendedData(
              isFriend: userId != user.id!,
              hasSentFriendRequest: false,
              hasReceivedFriendRequest: false,
              isSignedInUser: userId == user.id!,
            );
            return dish.copyWith(
                creator: user.copyWith(extendedData: userExtendedData));
          },
          toFirestore: (dish, options) => dish.toFirestore(),
        )
        .snapshots()
        .map(
          (snapshot) => right<CrudFailure, List<Dish>>(
            snapshot.docs.map((doc) => doc.data()).toList(),
          ),
        )
        .onErrorReturnWith(
      (e, stackTrace) {
        if (e is FirebaseException) {
          return left<CrudFailure, List<Dish>>(
            CrudFailure.firebase((e).message ?? "Unknown error."),
          );
        } else {
          throw (e);
        }
      },
    );
  }
}
