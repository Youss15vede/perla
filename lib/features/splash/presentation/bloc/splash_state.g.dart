// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final bool? isAuth;
  @override
  final String error;

  factory _$SplashState([void Function(SplashStateBuilder)? updates]) =>
      (new SplashStateBuilder()..update(updates))._build();

  _$SplashState._({this.isAuth, required this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'SplashState', 'error');
  }

  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => new SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState &&
        isAuth == other.isAuth &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isAuth.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashState')
          ..add('isAuth', isAuth)
          ..add('error', error))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState? _$v;

  bool? _isAuth;
  bool? get isAuth => _$this._isAuth;
  set isAuth(bool? isAuth) => _$this._isAuth = isAuth;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAuth = $v.isAuth;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashState build() => _build();

  _$SplashState _build() {
    final _$result = _$v ??
        new _$SplashState._(
            isAuth: isAuth,
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'SplashState', 'error'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
