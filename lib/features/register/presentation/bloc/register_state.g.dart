// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterState extends RegisterState {
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final bool success;

  factory _$RegisterState([void Function(RegisterStateBuilder)? updates]) =>
      (new RegisterStateBuilder()..update(updates))._build();

  _$RegisterState._(
      {required this.isLoading, required this.error, required this.success})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'RegisterState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'RegisterState', 'error');
    BuiltValueNullFieldError.checkNotNull(success, r'RegisterState', 'success');
  }

  @override
  RegisterState rebuild(void Function(RegisterStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterStateBuilder toBuilder() => new RegisterStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterState &&
        isLoading == other.isLoading &&
        error == other.error &&
        success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterState')
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('success', success))
        .toString();
  }
}

class RegisterStateBuilder
    implements Builder<RegisterState, RegisterStateBuilder> {
  _$RegisterState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  RegisterStateBuilder();

  RegisterStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _error = $v.error;
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterState;
  }

  @override
  void update(void Function(RegisterStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterState build() => _build();

  _$RegisterState _build() {
    final _$result = _$v ??
        new _$RegisterState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'RegisterState', 'isLoading'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'RegisterState', 'error'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'RegisterState', 'success'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
