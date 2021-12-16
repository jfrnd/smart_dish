import 'package:dartz/dartz.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';

abstract class IWatcherRepo<T> {
  Stream<Either<CrudFailure, T>> watchAll();
}
