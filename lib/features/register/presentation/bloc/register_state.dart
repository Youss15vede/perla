library register_state;

import 'package:built_value/built_value.dart';
part 'register_state.g.dart';

abstract class RegisterState implements Built<RegisterState,RegisterStateBuilder> {
  //getter fields

  bool get isLoading;

  String get error;

  bool get success;

  RegisterState._();

  factory RegisterState([Function(RegisterStateBuilder b) updates]) = _$RegisterState;

  factory RegisterState.initial() {
    return RegisterState(
          (b) => b
        ..isLoading = false
        ..success = false
        ..error = "",
    );
  }
}
