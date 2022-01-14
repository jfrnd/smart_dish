// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: implementation_imports
import 'package:collection/src/iterable_extensions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/user/i_user_repo.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/i_watcher_repo.dart';
import 'package:uuid/uuid.dart';

import 'household.dart';

const HOUSEHOLDS = "households";

abstract class IHouseholdRepo implements IWatcherRepo<List<Household>> {
  Future<Either<CrudFailure, Unit>> createHousehold(
      Household household, Uint8List? image);
  Future<Either<CrudFailure, Unit>> updateHousehold(
      Household household, Uint8List? image);
  Future<Either<CrudFailure, Unit>> deleteHousehold(Household household);
}

@LazySingleton(as: IHouseholdRepo)
class FirebaseHouseholdRepo implements IHouseholdRepo {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final IAuthRepo _authRepo;
  final IUserRepo _userRepo;

  FirebaseHouseholdRepo(
    this._firestore,
    this._authRepo,
    this._storage,
    this._userRepo,
  );

  @override
  Stream<Either<CrudFailure, List<Household>>> watchAll() async* {
    final userId = await _authRepo.getUserId();
    yield* _firestore
        .collection(HOUSEHOLDS)
        .where("members", arrayContains: userId)
        .orderBy("updatedAt", descending: true)
        .withConverter<Household>(
          fromFirestore: (snapshot, options) =>
              Household.fromFirestore(snapshot, options),
          toFirestore: (household, options) => household.toFirestore(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList())
        .switchMap(
      (households) {
        final occuringUserIds =
            (households.map((e) => e.members).expand((e) => e).toList() +
                    households.map((e) => e.createdBy).toList())
                .toSet()
                .toList();
        return _userRepo.watchUsers(occuringUserIds).switchMap(
              (failureOrUsers) => failureOrUsers.fold(
                (failure) =>
                    Stream.value(left<CrudFailure, List<Household>>(failure)),
                (users) {
                  final householdsWithUserData = households
                      .map(
                        (h) => h.copyWith(
                            membersUserData: h.members
                                .map((id) => users.firstWhere(
                                    (user) => user.id == id,
                                    orElse: () => User.empty()))
                                .toList(),
                            adminsUserData: h.members
                                .map((id) => users.firstWhere(
                                    (user) => user.id == id,
                                    orElse: () => User.empty()))
                                .toList(),
                            creator: users.firstWhereOrNull(
                              (user) => user.id == h.createdBy,
                            )),
                      )
                      .toList();
                  return Stream.value(
                    right<CrudFailure, List<Household>>(householdsWithUserData),
                  );
                },
              ),
            );
      },
    ).onErrorReturnWith(
      (e, stackTrace) {
        if (e is FirebaseException) {
          return left(e.toCrudFailure());
        } else {
          throw (e);
        }
      },
    );
  }

  @override
  Future<Either<CrudFailure, Unit>> createHousehold(
      Household household, Uint8List? image) async {
    final userId = await _authRepo.getUserId();
    String imageUrl = "";
    final String uid = const Uuid().v1();

    try {
      if (image != null) {
        await _storage
            .ref()
            .child(HOUSEHOLDS)
            .child(uid)
            .putData(image, SettableMetadata(contentType: "image/jpeg"));

        imageUrl =
            await _storage.ref().child(HOUSEHOLDS).child(uid).getDownloadURL();
      }

      await _firestore.collection(HOUSEHOLDS).doc(uid).set(household
          .copyWith(
            updatedBy: userId,
            createdBy: userId,
            imageUrl: imageUrl,
          )
          .toFirestore());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> updateHousehold(
      Household household, Uint8List? image) async {
    final userId = await _authRepo.getUserId();

    String imageUrl = household.imageUrl;
    try {
      if (image != null) {
        await _storage
            .ref()
            .child(HOUSEHOLDS)
            .child(household.id!)
            .putData(image, SettableMetadata(contentType: "image/jpeg"));

        imageUrl = await _storage
            .ref()
            .child(HOUSEHOLDS)
            .child(household.id!)
            .getDownloadURL();
      }

      await _firestore.collection(HOUSEHOLDS).doc(household.id).update(household
          .copyWith(
            updatedBy: userId,
            imageUrl: imageUrl,
          )
          .toFirestore());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> deleteHousehold(Household household) async {
    try {
      await _firestore.collection(HOUSEHOLDS).doc(household.id).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }
}
