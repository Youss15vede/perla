import 'package:equatable/equatable.dart';
import 'package:perla/core/entities/user_entity.dart';

class AuthEntity extends Equatable {
  final UserEntity? userEntity;
  final String? token;

  const AuthEntity({required this.userEntity,required this.token});

  @override
  List<Object?> get props => [
        userEntity,
        token,
      ];
}
