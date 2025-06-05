import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/login/domain/login_entity.dart';
import 'package:movie_app/features/auth/login/domain/login_repository.dart';
import 'package:movie_app/features/auth/login/domain/login_request_entity.dart';

class LoginUseCase
{
  late LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);
  Future<ApiResponse<LoginEntity>> invoke(LoginRequest request)async
  {
   return await loginRepository.login(request);
  }
}