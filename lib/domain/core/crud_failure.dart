import 'package:freezed_annotation/freezed_annotation.dart';
import 'failure.dart';

part 'crud_failure.freezed.dart';

@freezed
class CrudFailure extends Failure with _$CrudFailure {
  const factory CrudFailure.firebase(String info) = Firebase;
  const factory CrudFailure.doesNotExist() = DoesNotExist;
  const factory CrudFailure.stillLoading() = StillLoading;
  const factory CrudFailure.unknown(String info) = Unknown;
}
