import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:rxdart/rxdart.dart';

abstract class IUserRepo {
  Stream<Either<CrudFailure, List<User>>> watchUsers(List<String> userIds);
}

@LazySingleton(as: IUserRepo)
class FirebaseUserRepo implements IUserRepo {
  final FirebaseFirestore _firestore;

  FirebaseUserRepo(this._firestore);

  @override
  Stream<Either<CrudFailure, List<User>>> watchUsers(
      List<String> userIds) async* {
    if (userIds.isNotEmpty) {
      yield* _firestore
          .collection(USERS)
          .where("__name__", whereIn: userIds)
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
          if (e is FirebaseException) {
            return left(e.toCrudFailure());
          } else {
            throw (e);
          }
        },
      );
    } else {
      yield right<CrudFailure, List<User>>([]);
    }
  }
}
