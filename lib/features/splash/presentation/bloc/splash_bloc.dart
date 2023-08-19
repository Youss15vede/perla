import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/features/splash/data/domain/use_case/check_auth_use_case.dart';
import 'package:perla/features/splash/presentation/bloc/splash_event.dart';
import 'package:perla/features/splash/presentation/bloc/splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthUseCase _checkAuthUseCase;

  void checkAuth() {
    add(CheckAuth());
  }

  void clearError() {
    add(ClearError());
  }

  @factoryMethod
  SplashBloc(
      this._checkAuthUseCase,
      ) : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      if (event is CheckAuth) {
        final result = await _checkAuthUseCase(ParamsCheckAuthUseCase());
        result.fold(
              (failure) => emit(
            state.rebuild(
                  (b) => b
                ..isAuth = false
            ),
          ),
              (isAuth) => emit(
            state.rebuild(
                  (b) => b
                ..isAuth = isAuth
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
