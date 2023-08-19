library register_event;

import 'package:built_value/built_value.dart';

part 'register_event.g.dart';

abstract class RegisterEvent {}

abstract class Register extends RegisterEvent implements Built<Register, RegisterBuilder> {
  //getter fields
  String get fullName;

  String get phone;

  String get password;

  Register._();

  factory Register([Function(RegisterBuilder b) updates]) = _$Register;

  factory Register.initial() {
    return Register((b) => b);
  }
}

abstract class ClearError extends RegisterEvent
    implements Built<ClearError, ClearErrorBuilder> {
  //getter fields

  ClearError._();

  factory ClearError([Function(ClearErrorBuilder b) updates]) = _$ClearError;

  factory ClearError.initial() {
    return ClearError((b) => b);
  }
}
