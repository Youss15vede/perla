import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/data/base_repository.dart';
import 'package:perla/core/error/exception.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/network/network_info.dart';
import 'package:perla/core/utils/error_message.dart';
import 'package:perla/features/login/data/data_source/local_data_source/login_local_data_source.dart';
import 'package:perla/features/login/data/data_source/remote_data_source/login_remote_data_source.dart';
import 'package:perla/core/entities/auth_entity.dart';
import 'package:perla/features/login/domain/repository/login_repository.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImp extends BaseRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource _local;
  final LoginRemoteDataSource _http;

  LoginRepositoryImp(this._local, this._http,
      {required NetworkInfo networkInfo})
      : super(baseLocalDataSource: _local, networkInfo: networkInfo);

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final language = _local.getAppLanguage();
      final result = await _http.login(phone: phone, password: password);
      await _local.storeUser(result);
      // _local.getUserID();
      debugPrint('from repository we get the result :  ${result.token}');
      return Right(result);
    } on ServerException catch (e) {
      debugPrint('from repository we get failure');
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.error401));
    }
  }
}
