library login_state;

import 'package:built_value/built_value.dart';
part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  //getter fields

  bool get isLoading;

  String get error;

  bool get success;

  LoginState._();

  factory LoginState([Function(LoginStateBuilder b) updates]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState(
          (b) => b
        ..isLoading = false
        ..success = false
        ..error = "",
    );
  }
}
