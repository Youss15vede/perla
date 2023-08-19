import 'package:perla/core/data/base_remote_data_source.dart';
import 'package:perla/core/network/base_models/auth_model.dart';

abstract class RegisterRemoteDataSource extends BaseRemoteDataSource {
  Future<AuthModel> register({
    required String fullName,
    required String phone,
    required String password,
  });
}
