import 'package:movie_app/features/auth/forgot_password/domain/forget_password_data_source.dart';

import '../../../../core/api/api_response.dart';
import '../domain/forget_password_repository.dart';
import '../domain/forget_password_entity.dart';

class ForgetPassWordRepositoryImpl extends ForgetPassWordRepository {
  ForgetPassWordDataSource forgetPassWordDataSource;

  ForgetPassWordRepositoryImpl(this.forgetPassWordDataSource);

  @override
  Future<ApiResponse<ForgetPassWordEntity>> forgetPassword(String email) async {
    return await forgetPassWordDataSource.forgetPassword(email);
  }

  @override
  Future<ApiResponse<ForgetPassWordEntity>> resetCode(String code) async {
    return await forgetPassWordDataSource.resetCode(code);
  }

  @override
  Future<ApiResponse<ForgetPassWordEntity>> changePassword(
    String email,
    String newPassword,
  ) async {
    return await forgetPassWordDataSource.changePassword(email, newPassword);
  }
}
