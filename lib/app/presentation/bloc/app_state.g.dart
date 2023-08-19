// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final int color;
  @override
  final int appLanguage;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._({required this.color, required this.appLanguage}) : super._() {
    BuiltValueNullFieldError.checkNotNull(color, r'AppState', 'color');
    BuiltValueNullFieldError.checkNotNull(
        appLanguage, r'AppState', 'appLanguage');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        color == other.color &&
        appLanguage == other.appLanguage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, appLanguage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('color', color)
          ..add('appLanguage', appLanguage))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  int? _color;
  int? get color => _$this._color;
  set color(int? color) => _$this._color = color;

  int? _appLanguage;
  int? get appLanguage => _$this._appLanguage;
  set appLanguage(int? appLanguage) => _$this._appLanguage = appLanguage;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _color = $v.color;
      _appLanguage = $v.appLanguage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    final _$result = _$v ??
        new _$AppState._(
            color: BuiltValueNullFieldError.checkNotNull(
                color, r'AppState', 'color'),
            appLanguage: BuiltValueNullFieldError.checkNotNull(
                appLanguage, r'AppState', 'appLanguage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
