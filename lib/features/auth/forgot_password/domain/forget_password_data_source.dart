import '../../../../core/api/api_response.dart';
import 'forget_password_entity.dart';

abstract class ForgetPassWordDataSource
{
  Future<ApiResponse<ForgetPassWordEntity>> forgetPassword(String email);
  Future<ApiResponse<ForgetPassWordEntity>> resetCode(String code);
  Future<ApiResponse<ForgetPassWordEntity>> changePassword(
      String email,
      String newPassword,
      ) ;
}