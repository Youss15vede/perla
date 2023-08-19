// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as int?,
      json['username'] as String?,
      json['points'] as int?,
      json['phone'] as String?,
      json['image_path'] as String?,
      json['timestamp'] as String?,
      json['user_type'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.userName,
      'points': instance.points,
      'phone': instance.phoneNumber,
      'image_path': instance.imagePath,
      'timestamp': instance.timesTamp,
      'user_type': instance.userType,
    };
