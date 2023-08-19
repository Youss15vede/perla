library login_event;

import 'package:built_value/built_value.dart';

part 'login_event.g.dart';

abstract class LoginEvent {}

abstract class Login extends LoginEvent implements Built<Login, LoginBuilder> {
  //getter fields

  String get phone;

  String get password;

  Login._();

  factory Login([Function(LoginBuilder b) updates]) = _$Login;

  factory Login.initial() {
    return Login((b) => b);
  }
}

abstract class ClearError extends LoginEvent
    implements Built<ClearError, ClearErrorBuilder> {
  //getter fields

  ClearError._();

  factory ClearError([Function(ClearErrorBuilder b) updates]) = _$ClearError;

  factory ClearError.initial() {
    return ClearError((b) => b);
  }
}
