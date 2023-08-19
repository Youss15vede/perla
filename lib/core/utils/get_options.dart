import 'package:dio/dio.dart';

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String? token,
      {int? language}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept-Language': language,
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': language,
      };
    }
    return options;
  }
}
