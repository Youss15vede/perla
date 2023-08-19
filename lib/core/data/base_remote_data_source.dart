import 'dart:convert';

import 'package:perla/core/error/exception.dart';
import 'package:perla/core/models/base_list_response_model.dart';
import 'package:perla/core/models/base_response_model.dart';
import 'package:perla/core/utils/error_message.dart';
import 'package:perla/core/utils/get_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<List<T>> performGetListRequest<T>(
    String endpoint,
    String token,
    int language,
  );

  @protected
  Future<T> performGetRequest<T>({
    required String endpoint,
    required String token,
    required int language,
  });
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<T>> performGetListRequest<T>(
      String endpoint, String token, int language) async {
    debugPrint('performGetRequest');
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token, language: language),
      );
      if (response.statusCode == 200) {
        final BaseListResponseModel<T> finalResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.status!) {
          return finalResponse.data!;
        } else {
          debugPrint('e is error');
          throw ServerException(error: finalResponse.message ?? "");
        }
      } else if (response.statusCode == 401) {
        throw ServerException(error: ErrorMessage.error401);
      } else {
        debugPrint('e is error');
        throw ServerException(error: ErrorMessage.error401);
      }
    } catch (e) {
      debugPrint('e is $e');
      if (e is DioError) {
        debugPrint('response code is ${e.response!.statusCode}');
        if (e.response!.statusCode == 401) {
          debugPrint('response code is ${e.response!.statusCode}');
          throw ServerException(error: ErrorMessage.error401);
        } else {
          throw ServerException(error: ErrorMessage.error401);
        }
      } else if (e is ServerException) {
        rethrow;
      }
      throw ServerException(error: ErrorMessage.error401);
    }
  }

  @override
  Future<T> performGetRequest<T>({
    required String endpoint,
    required String token,
    int language = 0,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(
          token,
          language: language,
        ),
      );
      if (response.statusCode == 200) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          debugPrint('data is not null');
          return finalResponse.data!;
        } else {
          debugPrint('e is error');
          throw ServerException(error: finalResponse.message ?? "");
        }
      }
      else if (response.statusCode == 401) {
        throw ServerException(error: ErrorMessage.error401);
      }
      else {
        debugPrint('e is error');
        throw ServerException(error: ErrorMessage.error401);
      }
    } catch (e) {
      debugPrint('e is $e');
      if (e is DioError) {
        debugPrint('response code is ${e.response!.statusCode}');
        if (e.response!.statusCode == 401) {
          debugPrint('response code is ${e.response!.statusCode}');
          throw ServerException(error: ErrorMessage.error401);
        } else {
          throw ServerException(error: ErrorMessage.error401);
        }
      } else if (e is ServerException) {
        rethrow;
      }
      throw ServerException(error: ErrorMessage.error401);
    }
  }
}
