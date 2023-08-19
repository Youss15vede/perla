// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
        Map<String, dynamic> json) =>
    BaseResponseModel<T>(
      json['message'] as String?,
      _dataFromJson(json['data'] as Object),
    );

Map<String, dynamic> _$BaseResponseModelToJson<T>(
        BaseResponseModel<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': _dataToJson(instance.data),
    };
