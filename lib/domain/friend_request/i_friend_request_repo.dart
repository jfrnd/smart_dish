// ignore_for_file: constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/i_watcher_repo.dart';

const FRIEND_REQUESTS = "friendRequests";
const FRIENDSHIPS = "friendships";

abstract class IFriendRequestRepo implements IWatcherRepo<List<FriendRequest>> {
  Future<Either<CrudFailure, List<User>>> searchUser(String searchStr);
  Future<Either<CrudFailure, Unit>> sendFriendRequest(User user);
  Future<Either<CrudFailure, Unit>> confirmFriendRequest(String requestId);
  Future<Either<CrudFailure, Unit>> rejectFriendRequest(String requestId);
  Future<Either<CrudFailure, Unit>> deleteFriend(String userId);
  Stream<Either<CrudFailure, List<FriendRequest>>> watchFriendRequests();
}

@LazySingleton(as: IFriendRequestRepo)
class FirebaseFriendRequestRepo implements IFriendRequestRepo {
  final FirebaseFunctions _functions;
  final IAuthRepo _authRepo;
  final FirebaseFirestore _firestore;

  FirebaseFriendRequestRepo(
    this._functions,
    this._authRepo,
    this._firestore,
  );

  @override
  Stream<Either<CrudFailure, List<FriendRequest>>> watchAll() async* {
    yield* watchFriendRequests();
  }

  @override
  Stream<Either<CrudFailure, List<FriendRequest>>>
      watchFriendRequests() async* {
    final userId = await _authRepo.getUserId();

    final sentRequestsStream = _firestore
        .collection(FRIEND_REQUESTS)
        .where("senderId", isEqualTo: userId)
        .withConverter<FriendRequest>(
          fromFirestore: (snapshot, options) =>
              FriendRequest.fromFirestore(snapshot, options).copyWith(
            isReceivedBySignedInUser: false,
          ),
          toFirestore: (request, options) => request.toFirestore(options),
        )
        .snapshots()
        .map(
          (snapshot) => right<CrudFailure, List<FriendRequest>>(
              snapshot.docs.map((doc) => doc.data()).toList()),
        );

    final receivedRequestsStream = _firestore
        .collection(FRIEND_REQUESTS)
        .where("receiverId", isEqualTo: userId)
        .withConverter<FriendRequest>(
          fromFirestore: (snapshot, options) =>
              FriendRequest.fromFirestore(snapshot, options).copyWith(
            isReceivedBySignedInUser: true,
          ),
          toFirestore: (request, options) => request.toFirestore(options),
        )
        .snapshots()
        .map(
          (snapshot) => right<CrudFailure, List<FriendRequest>>(
            snapshot.docs.map((doc) => doc.data()).toList(),
          ),
        );

    yield* CombineLatestStream.combine2(
        sentRequestsStream, receivedRequestsStream, (
      Either<CrudFailure, List<FriendRequest>> sentRequests,
      Either<CrudFailure, List<FriendRequest>> receivedRequests,
    ) {
      List<FriendRequest> requests;
      return sentRequests
          .fold((failure) => left<CrudFailure, List<FriendRequest>>(failure),
              (sentRequests) {
        requests = sentRequests;
        return receivedRequests.fold(
          (failure) => left<CrudFailure, List<FriendRequest>>(failure),
          (receivedRequests) => right<CrudFailure, List<FriendRequest>>(
            requests + receivedRequests,
          ),
        );
      });
    }).onErrorReturnWith(
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
  Future<Either<CrudFailure, List<User>>> searchUser(String searchStr) async {
    if (searchStr.isNotEmpty) {
      try {
        return await _firestore
            .collection(USERS)
            .where(USER_NAME, isGreaterThanOrEqualTo: searchStr)
            .where(USER_NAME, isLessThanOrEqualTo: searchStr + '\uf8ff')
            .withConverter<User>(
              fromFirestore: (snapshot, _) => User.fromFirestore(snapshot, _),
              toFirestore: (user, _) => user.toFirestore(_),
            )
            .get()
            .then((snapshot) =>
                right(snapshot.docs.map((doc) => doc.data()).toList()));
      } on FirebaseException catch (e) {
        return left(e.toCrudFailure());
      }
    } else {
      return left(const CrudFailure.notFound("Nothing found."));
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> sendFriendRequest(User user) async {
    try {
      final callable = _functions.httpsCallable("friendRequest-send");
      await callable({"userId": user.id});
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> confirmFriendRequest(
      String requestId) async {
    try {
      final callable = _functions.httpsCallable("friendRequest-confirm");
      await callable({"requestId": requestId});
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> rejectFriendRequest(
      String requestId) async {
    try {
      final callable = _functions.httpsCallable("friendRequest-reject");
      await callable({"requestId": requestId});
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> deleteFriend(String userId) async {
    try {
      final callable = _functions.httpsCallable("friendship-deleteFriendShip");
      await callable({"userId": userId});
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.toCrudFailure());
    }
  }
}
