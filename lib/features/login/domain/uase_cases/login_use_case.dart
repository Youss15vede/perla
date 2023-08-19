import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/entities/auth_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/login_repository.dart';

@lazySingleton
class LoginUseCase implements UseCase<AuthEntity, ParamsLoginUseCase> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(ParamsLoginUseCase params) async {
    return await _loginRepository.login(
      phone: params.phone,
      password: params.password,
    );
  }
}

class ParamsLoginUseCase {
  final String phone;
  final String password;

  ParamsLoginUseCase({
    required this.phone,
    required this.password,
  });
}
