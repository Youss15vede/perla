import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenDesignSize {
  static const double height = 812;
  static const double width = 375;
}

class GetOptions {
  static Options options = Options();

  static Options getOptions(String? token) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    return options;
  }
}

class RequestBody {
  static FormData register({
    required String name,
    required String phone,
    required String password,
  }) {

    return FormData.fromMap({
      'full_name': name,
      'phone': phone,
      'password': password,
    });
  }

  static FormData login({
    required String phone,
    required String password,
  }) {
    return FormData.fromMap({
      'phone': phone,
      'password': password,
    });
  }
}

void error({
  required String errorMsg,
  context,
  bloc,
}) {
  debugPrint('Error message is "$errorMsg"');
  debugPrint(bloc.state.toString());
  if (errorMsg.isNotEmpty) {
    Fluttertoast.showToast(
      // msg: errorMsg == ErrorMessage.error401
      //     ? AppLocalizations.of(context).translate(errorMsg)
      //     : errorMsg == ErrorMessage.SONG_ADDED_SECCESSFULLY
      //     ? AppLocalizations.of(context).translate(errorMsg)
      //     : errorMsg,
      msg: errorMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      //Color.fromRGBO(255, 86, 31, 1),
      fontSize: 16.0,
    );
    bloc.clearError();
  }
}
