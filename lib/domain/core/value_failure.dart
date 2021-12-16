import 'package:equatable/equatable.dart';

abstract class ValueFailure<T> extends Equatable {
  const ValueFailure();

  T get failureInfo;

  @override
  List<Object?> get props => [failureInfo];
}
