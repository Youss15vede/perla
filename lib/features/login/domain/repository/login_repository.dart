import 'package:dartz/dartz.dart';
import 'package:perla/core/data/base_repository.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/entities/auth_entity.dart';

abstract class LoginRepository extends BaseRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String phone,
    required String password,
  });
}
