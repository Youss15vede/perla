import 'package:perla/core/data/base_remote_data_source.dart';
import 'package:perla/core/network/base_models/auth_model.dart';

abstract class LoginRemoteDataSource extends BaseRemoteDataSource {
  Future<AuthModel> login({
    required String phone,
    required String password,
  });
}
