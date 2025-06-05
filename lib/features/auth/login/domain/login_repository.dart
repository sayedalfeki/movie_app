import '../../../../core/api/api_response.dart';
import 'login_entity.dart';
import 'login_request_entity.dart';

abstract class LoginRepository
{
  Future<ApiResponse<LoginEntity>> login(LoginRequest request);
}