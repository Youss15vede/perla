import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:perla/app/domain/repository/app_repository.dart';
import 'app_event.dart';
import 'app_state.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository _repository;

  void getInitColor() {
    add(GetColor());
  }

  void getAppLanguage() {
    add(GetAppLanguage());
  }

  @factoryMethod
  AppBloc(this._repository) : super(AppState.initial()) {
    on<AppEvent>((event, emit) async {
      if (event is GetColor) {
        final color = _repository.getColor();
        emit(state.rebuild((b) => b..color = color));
      }

      if (event is GetAppLanguage) {
        final language =  _repository.getAppLanguage();
        emit(state.rebuild((b) => b..appLanguage = language));
      }
    });
  }
}
