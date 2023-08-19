import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  //getter fields

  bool? get isAuth;

  String get error;


  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState(
          (b) => b
        ..isAuth = null
        ..error = '',
    );
  }
}
