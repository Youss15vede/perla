import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/data/base_repository.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/network/network_info.dart';
import 'package:perla/features/splash/data/data_source/splash_local_data_source/splash_local_data_source.dart';
import 'package:perla/features/splash/data/domain/repository/splash_repository.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImp extends BaseRepositoryImpl
    implements SplashRepository {
  final SplashLocalDataSource _local;

  SplashRepositoryImp(
      this._local,
      NetworkInfo networkInfo,
      ) : super(baseLocalDataSource: _local, networkInfo: networkInfo);

  @override
  Future<Either<Failure, bool>> checkAuth() async {
    try {
      final token = await _local.token;
      if (token.isEmpty) {
        return const Right(false);
      } else {
        return const Right(true);
      }
    } catch (e) {
      return const Left(
        CacheFailure(),
      );
    }
  }

}
