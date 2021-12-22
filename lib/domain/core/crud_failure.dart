import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'failure.dart';

part 'crud_failure.freezed.dart';

@freezed
class CrudFailure extends Failure with _$CrudFailure {
  const factory CrudFailure.stillLoading() = StillLoading;
  const factory CrudFailure.unknown(String msg) = Unknown;
  const factory CrudFailure.cancelled(String msg) = Cancelled;
  const factory CrudFailure.aborted(String msg) = Aborted;
  const factory CrudFailure.dataLoss(String msg) = DataLoss;
  const factory CrudFailure.alreadyExists(String msg) = AlreadyExists;
  const factory CrudFailure.deadlineExceeded(String msg) = DeadlineExceeded;
  const factory CrudFailure.failedPrecondition(String msg) = FailedPrecondition;
  const factory CrudFailure.internal(String msg) = Internal;
  const factory CrudFailure.invalidArgument(String msg) = InvalidArgumen;
  const factory CrudFailure.notFound(String msg) = NotFound;
  const factory CrudFailure.ok(String msg) = Ok;
  const factory CrudFailure.outOfRange(String msg) = OutOfRange;
  const factory CrudFailure.permissionDenied(String msg) = PermissionDenied;
  const factory CrudFailure.resourceExhausted(String msg) = ResourceExhausted;
  const factory CrudFailure.unauthenticated(String msg) = Unauthenticated;
  const factory CrudFailure.unavailable(String msg) = Unavailable;
  const factory CrudFailure.unimplemented(String msg) = Unimplemented;
}

extension FirebaseExceptionX on FirebaseException {
  CrudFailure toCrudFailure() {
    switch (code) {
      case "cancelled":
        return CrudFailure.cancelled(message ?? code.toString());
      case "aborted":
        return CrudFailure.aborted(message ?? code.toString());
      case "data-loss":
        return CrudFailure.dataLoss(message ?? code.toString());
      case "already-exists":
        return CrudFailure.alreadyExists(message ?? code.toString());
      case "deadline-exceeded":
        return CrudFailure.deadlineExceeded(message ?? code.toString());
      case "failed-precondition":
        return CrudFailure.failedPrecondition(message ?? code.toString());
      case "internal":
        return CrudFailure.internal(message ?? code.toString());
      case "invalid-argument":
        return CrudFailure.invalidArgument(message ?? code.toString());
      case "not-found":
        return CrudFailure.notFound(message ?? code.toString());
      case "ok":
        return CrudFailure.ok(message ?? code.toString());
      case "out-of-range":
        return CrudFailure.outOfRange(message ?? code.toString());
      case "permission-denied":
        return CrudFailure.permissionDenied(message ?? code.toString());
      case "resource-exhausted":
        return CrudFailure.resourceExhausted(message ?? code.toString());
      case "unauthenticated":
        return CrudFailure.unauthenticated(message ?? code.toString());
      case "unavailable":
        return CrudFailure.unavailable(message ?? code.toString());
      case "unimplemented":
        return CrudFailure.unimplemented(message ?? code.toString());
      case "unknown":
        return CrudFailure.unknown(message ?? "unknown error");
      default:
        return CrudFailure.unknown(message ?? "unknown error");
    }
  }
}
