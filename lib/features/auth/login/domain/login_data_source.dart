import '../../../../core/api/api_response.dart';
import 'login_entity.dart';
import 'login_request_entity.dart';

abstract class LoginDataSource
{
  Future<ApiResponse<LoginEntity>> login(LoginRequest request);
}