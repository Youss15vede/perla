import 'package:dartz/dartz.dart';
import 'package:perla/core/data/base_repository.dart';
import 'package:perla/core/error/failure.dart';

abstract class SplashRepository extends BaseRepository {
  Future<Either<Failure, bool>> checkAuth();
}
