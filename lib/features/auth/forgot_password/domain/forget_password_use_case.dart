import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/forgot_password/domain/forget_password_entity.dart';
import 'package:movie_app/features/auth/forgot_password/domain/forget_password_repository.dart';

class ForgetPassWordUseCase {
  ForgetPassWordRepository forgetPassWordRepository;

  ForgetPassWordUseCase(this.forgetPassWordRepository);

  Future<ApiResponse<ForgetPassWordEntity>> verifyEmail(String email) async {
    return await forgetPassWordRepository.forgetPassword(email);
  }

  Future<ApiResponse<ForgetPassWordEntity>> resetCode(String code) async {
    return await forgetPassWordRepository.resetCode(code);
  }

  Future<ApiResponse<ForgetPassWordEntity>> changePassword(
    String email,
    String newPassword,
  ) async {
    return await forgetPassWordRepository.changePassword(email, newPassword);
  }
}
