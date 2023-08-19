import 'package:built_value/built_value.dart';
part 'splash_event.g.dart';

abstract class SplashEvent {}

abstract class CheckAuth extends SplashEvent
    implements Built<CheckAuth, CheckAuthBuilder> {
  //getter fields
  CheckAuth._();

  factory CheckAuth([Function(CheckAuthBuilder b) updates]) = _$CheckAuth;

  factory CheckAuth.initial() {
    return CheckAuth((b) => b);
  }
}

abstract class ClearError extends SplashEvent
    implements Built<ClearError, ClearErrorBuilder> {
  //getter fields

  ClearError._();

  factory ClearError([Function(ClearErrorBuilder b) updates]) = _$ClearError;

  factory ClearError.initial() {
    return ClearError((b) => b);
  }
}