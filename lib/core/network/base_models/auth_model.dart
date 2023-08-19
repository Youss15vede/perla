// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:perla/core/network/base_models/user_model.dart';
import 'package:perla/core/entities/auth_entity.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends AuthEntity {
  static String className = "AuthModel";
  @JsonKey(name: 'user')
  final UserModel? userModel;
  @override
  @JsonKey(name: 'token')
  final String? token;

  const AuthModel(this.userModel, this.token)
      : super(userEntity: userModel, token: token);
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
