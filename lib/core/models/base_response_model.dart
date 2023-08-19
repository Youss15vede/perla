library base_response_model;
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:perla/core/network/base_models/auth_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel<T> {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;

  BaseResponseModel(
    this.message,
    this.data,
  );

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson<T>(json);
  }
}

T? _dataFromJson<T>(Object data) {
  if (data is List<dynamic> && data.isEmpty) {
    return null;
  } else if (data is Map<String, dynamic>) {
     if (T.toString() == AuthModel.className) {
      return AuthModel.fromJson(data) as T;
    }
    else if (T.toString() == 'Null') {
      debugPrint('Null Data');
      return null;
    }
  }
  throw Exception('parse error');
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) => {
      'data': input,
    };
