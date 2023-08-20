import 'package:injectable/injectable.dart';
import 'package:perla/core/utils/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalDataSource {
  Future<String> get token;

  int getAppColor();

  Future<void> setAppColor(int value);

  int getUserID();

  Future<void> setUserID(int value);

  Future<void> setAppLanguage(int value);

  int getAppLanguage();

  Future<void> logout();
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImp implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImp({required this.sharedPreferences});

  @override
  int getAppColor() {
    return sharedPreferences.getInt(SharedPreferencesKeys.appColor) ?? 0;
  } // 0 white // 1 dark

  @override
  int getAppLanguage() =>
      sharedPreferences.getInt(SharedPreferencesKeys.appLanguage) ??
          0; // 0 English // 1 Arabic

  @override
  Future<void> logout() async =>
      sharedPreferences.remove(SharedPreferencesKeys.apiToken);

  @override
  Future<void> setAppColor(int value) async {
    await sharedPreferences.setInt(SharedPreferencesKeys.appColor, value);
  }

  @override
  Future<void> setAppLanguage(int value) async =>
      await sharedPreferences.setInt(SharedPreferencesKeys.appLanguage, value);

  @override
  Future<String> get token async =>
      sharedPreferences.getString(SharedPreferencesKeys.apiToken) ?? "";

  @override
  int getUserID() {
    return sharedPreferences.getInt(SharedPreferencesKeys.userID) ?? 0;
  }

  @override
  Future<void> setUserID(int value)async =>
      await sharedPreferences.setInt(SharedPreferencesKeys.userID, value);
}
