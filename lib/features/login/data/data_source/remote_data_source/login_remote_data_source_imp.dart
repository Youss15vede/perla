import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/core/data/base_remote_data_source.dart';
import 'package:perla/core/data/end_points.dart';
import 'package:perla/core/error/exception.dart';
import 'package:perla/core/models/base_response_model.dart';
import 'package:perla/core/utils/constants.dart';
import 'package:perla/core/utils/error_message.dart';
import 'package:perla/features/login/data/data_source/remote_data_source/login_remote_data_source.dart';
import 'package:perla/core/network/base_models/auth_model.dart';
@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements LoginRemoteDataSource {
  LoginRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    final formData = RequestBody.login(
      phone: phone,
      password: password,
    );

    final body = {
      'phone': phone,
      'password': password,
    };

    if (kDebugMode) {
      print(formData.fields);
    }

    final response = await dio.post(
      EndPoint.login,
      options: GetOptions.getOptions(''),
      data: body,
    );
    if (response.statusCode == 200) {
      final BaseResponseModel<AuthModel> finalResponse =
      BaseResponseModel<AuthModel>.fromJson(json.decode(response.data));
      if (finalResponse.data != null) {
        debugPrint('data is not null');
        return finalResponse.data!;
      } else {
        debugPrint('e is error');
        throw ServerException(error: finalResponse.message ?? "");
      }
    } else {
      throw ServerException(error: ErrorMessage.error401);
    }
  }
}
