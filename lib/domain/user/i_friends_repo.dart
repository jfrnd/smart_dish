// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/user/i_user_repo.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/i_watcher_repo.dart';

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
  final IUserRepo _userRepo;

  FirebaseFriendsRepo(
    this._authRepo,
    this._firestore,
    this._userRepo,
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
        (ids) => _userRepo.watchUsers(ids),
      ),
    );
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
        if (e is FirebaseException) {
          return left(e.toCrudFailure());
        } else {
          throw (e);
        }
      },
    );
  }
}
