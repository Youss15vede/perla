import 'package:injectable/injectable.dart';
import 'package:perla/core/data/base_local_data_source.dart';
import 'package:perla/core/utils/shared_preferences_keys.dart';
import 'package:perla/core/network/base_models/auth_model.dart';
import 'package:perla/features/register/data/data_source/local_data_source/register_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: RegisterLocalDataSource)
class RegisterLocalDataSourceImp extends BaseLocalDataSourceImp
    implements RegisterLocalDataSource {
  RegisterLocalDataSourceImp({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  Future<void> storeUser(AuthModel user) async {
    sharedPreferences.setString(SharedPreferencesKeys.userName, user.userModel?.userName ?? '');
    sharedPreferences.setString(
        SharedPreferencesKeys.apiToken, user.token!);
  }
}
