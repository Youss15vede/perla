import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/usecases/usecase.dart';
import '../repository/splash_repository.dart';

@lazySingleton
class CheckAuthUseCase implements UseCase<bool, ParamsCheckAuthUseCase> {
  final SplashRepository _splashRepository;

  CheckAuthUseCase(this._splashRepository);

  @override
  Future<Either<Failure, bool>> call(ParamsCheckAuthUseCase params) async {
    return await _splashRepository.checkAuth();
  }
}

class ParamsCheckAuthUseCase{
  ParamsCheckAuthUseCase();
}
