import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_dish/domain/core/value_failure.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  Either<ValueFailure<dynamic>, T> get value;

  T getOrCrash() {
    return value.fold(
      (l) => throw Exception(),
      (r) => r,
    );
  }

  ValueFailure<dynamic> getFailureOrCrash() {
    return value.fold(
      (f) => f,
      (r) => throw Exception(),
    );
  }

  bool isValid() => value.isRight();
  bool isInvalid() => value.isLeft();

  @override
  List<Object?> get props => [value];
}
