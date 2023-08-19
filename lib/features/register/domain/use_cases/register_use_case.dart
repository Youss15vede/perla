import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/error/failure.dart';
import 'package:perla/core/entities/auth_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/register_repository.dart';

@lazySingleton
class RegisterUseCase implements UseCase<AuthEntity, ParamsRegisterUseCase> {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(ParamsRegisterUseCase params) async {
    return await _registerRepository.register(
      fullName: params.fullName,
      phone: params.phone,
      password: params.password,
    );
  }
}

class ParamsRegisterUseCase {
  final String fullName;
  final String phone;
  final String password;

  ParamsRegisterUseCase({
    required this.fullName,
    required this.phone,
    required this.password,
  });
}
