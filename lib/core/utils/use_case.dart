import 'package:architecture_core/architecture_core.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<L, R> {
  Future<Either<Failure, L>> call([R? params]) {
    throw UnimplementedError("call must be implemented");
  }
}