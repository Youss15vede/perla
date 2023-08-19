// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:perla/core/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  static String className = "UserModel";
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'username')
  final String? userName;
  @override
  @JsonKey(name: 'points')
  final int? points;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @override
  @JsonKey(name: 'timestamp')
  final String? timesTamp;
  @override
  @JsonKey(name: 'user_type')
  final String? userType;

  const UserModel(this.id, this.userName, this.points, this.phoneNumber,
      this.imagePath, this.timesTamp, this.userType)
      : super(
          id: id,
          userName: userName,
          points: points,
          phoneNumber: phoneNumber,
          imagePath: imagePath,
          timesTamp: timesTamp,
          userType: userType,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
