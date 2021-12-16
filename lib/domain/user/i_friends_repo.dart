// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/i_watcher_repo.dart';
import 'package:smart_dish/utils/logger.dart';

const FRIEND_REQUESTS = "friendRequests";
const FRIENDSHIPS = "friendships";

enum Filter { received, sent }

abstract class IUserFriendsRepo implements IWatcherRepo<List<User>> {
  Stream<Either<CrudFailure, List<User>>> watchFriends();
}

@LazySingleton(as: IUserFriendsRepo)
class FirebaseFriendsRepo implements IUserFriendsRepo {
  final IAuthRepo _authRepo;
  final FirebaseFirestore _firestore;

  FirebaseFriendsRepo(
    this._authRepo,
    this._firestore,
  );

  @override
  Stream<Either<CrudFailure, List<User>>> watchAll() async* {
    yield* watchFriends();
  }

  @override
  Stream<Either<CrudFailure, List<User>>> watchFriends() async* {
    yield* watchFriendsUserIds().switchMap(
      (failureOrIds) => failureOrIds.fold(
        (failure) => Stream.value(left(failure)),
        (ids) => watchUsers(ids),
      ),
    );
  }

  Stream<Either<CrudFailure, List<User>>> watchUsers(List<String> ids) async* {
    if (ids.isNotEmpty) {
      yield* _firestore
          .collection(USERS)
          .where("__name__", whereIn: ids)
          .withConverter<User>(
            fromFirestore: (snapshot, options) =>
                User.fromFirestore(snapshot, options),
            toFirestore: (user, options) => user.toFirestore(options),
          )
          .snapshots()
          .map(
            (snapshot) => right<CrudFailure, List<User>>(
              snapshot.docs.map((doc) => doc.data()).toList(),
            ),
          )
          .onErrorReturnWith(
        (e, stackTrace) {
          return left<CrudFailure, List<User>>(
            CrudFailure.firebase(
                (e as FirebaseException).message ?? "Unknown error."),
          );
        },
      );
    } else {
      yield right<CrudFailure, List<User>>([]);
    }
  }

  Stream<Either<CrudFailure, List<String>>> watchFriendsUserIds() async* {
    final userId = await _authRepo.getUserId();

    yield* _firestore
        .collection(FRIENDSHIPS)
        .where("users", arrayContains: userId)
        .withConverter<String>(
          fromFirestore: (snapshot, options) {
            return (snapshot.data()!["users"] as List<dynamic>)
                .firstWhere((id) => id != userId);
          },
          toFirestore: (request, options) => {},
        )
        .snapshots()
        .map(
          (snapshot) => right<CrudFailure, List<String>>(
            snapshot.docs.map((doc) => doc.data()).toList(),
          ),
        )
        .onErrorReturnWith(
      (e, stackTrace) {
        return left<CrudFailure, List<String>>(
          CrudFailure.firebase(
              (e as FirebaseException).message ?? "Unknown error."),
        );
      },
    );
  }
}
