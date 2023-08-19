import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/features/register/domain/use_cases/register_use_case.dart';
import 'package:perla/features/register/presentation/bloc/register_event.dart';
import 'package:perla/features/register/presentation/bloc/register_state.dart';
@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  void register({
    required String fullName,
    required String phone,
    required String password,
  }) {
    add(Register((b) => b
      ..fullName = fullName
      ..phone = phone
      ..password = password));
  }

  void clearError() {
    add(ClearError());
  }

  @factoryMethod
  RegisterBloc(
      this._registerUseCase,
      ) : super(RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is Register) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await _registerUseCase(
          ParamsRegisterUseCase(
            fullName: event.fullName,
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
