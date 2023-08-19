library app_event;

import 'package:built_value/built_value.dart';
part 'app_event.g.dart';

abstract class AppEvent {}

abstract class GetColor extends AppEvent
    implements Built<GetColor, GetColorBuilder> {
  //getter fields
  GetColor._();

  factory GetColor([Function(GetColorBuilder b) updates]) = _$GetColor;

  factory GetColor.initial() {
    return GetColor((b) => b);
  }
}

abstract class GetAppLanguage extends AppEvent
    implements Built<GetAppLanguage, GetAppLanguageBuilder> {
  // fields go here

  GetAppLanguage._();

  factory GetAppLanguage([Function(GetAppLanguageBuilder b) updates]) = _$GetAppLanguage;
}
