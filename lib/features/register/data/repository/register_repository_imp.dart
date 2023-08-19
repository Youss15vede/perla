import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/data/base_repository.dart';
import 'package:perla/core/error/exception.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/network/network_info.dart';
import 'package:perla/core/utils/error_message.dart';
import 'package:perla/core/entities/auth_entity.dart';
import 'package:perla/features/register/data/data_source/local_data_source/register_local_data_source.dart';
import 'package:perla/features/register/data/data_source/remote_data_source/register_remote_data_source.dart';
import 'package:perla/features/register/domain/repository/register_repository.dart';

@LazySingleton(as: RegisterRepository)
class RegisterRepositoryImp extends BaseRepositoryImpl implements RegisterRepository {
  final RegisterLocalDataSource _local;
  final RegisterRemoteDataSource _http;

  RegisterRepositoryImp(this._local, this._http,
      {required NetworkInfo networkInfo})
      : super(baseLocalDataSource: _local, networkInfo: networkInfo);

  @override
  Future<Either<Failure, AuthEntity>> register({
    required String fullName,
    required String phone,
    required String password,
  }) async {
    try {
      final language = _local.getAppLanguage();
      final result = await _http.register(fullName: fullName,phone: phone, password: password);
      await _local.storeUser(result);
      return Right(result);
    } on ServerException catch (e) {
      debugPrint('from repository we get failure');
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.error401));
    }
  }
}
