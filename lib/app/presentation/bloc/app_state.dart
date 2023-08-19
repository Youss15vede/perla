library app_state;

import 'package:built_value/built_value.dart';
part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  int get color;

  int get appLanguage;

  AppState._();

  factory AppState([Function(AppStateBuilder b) updates]) = _$AppState;

  factory AppState.initial() {
    return AppState((b) => b
      ..color = 0
      ..appLanguage = 0);
  }
}

