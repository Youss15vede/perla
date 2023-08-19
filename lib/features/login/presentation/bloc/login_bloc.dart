import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/features/login/domain/uase_cases/login_use_case.dart';

import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  void login({
    required String phone,
    required String password,
  }) {
    add(Login((b) => b
      ..phone = phone
      ..password = password));
  }

  void clearError() {
    add(ClearError());
  }

  @factoryMethod
  LoginBloc(
    this._loginUseCase,
  ) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await _loginUseCase(
          ParamsLoginUseCase(
            phone: event.phone,
            password: event.password,
          ),
        );
        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..error = failure.error
                ..success = false,
            ),
          ),
          (user) => emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..error = ''
                ..success = true,
            ),
          ),
        );
      }
      if (event is ClearError) {
        emit(state.rebuild((b) => b..error = ''));
      }
    });
  }
}
