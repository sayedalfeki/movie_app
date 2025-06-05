import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/login/domain/login_data_source.dart';
import 'package:movie_app/features/auth/login/domain/login_entity.dart';
import 'package:movie_app/features/auth/login/domain/login_repository.dart';
import 'package:movie_app/features/auth/login/domain/login_request_entity.dart';

class LoginRepositoryImpl extends LoginRepository
{
  late LoginDataSource loginDataSource;
  LoginRepositoryImpl(this.loginDataSource);
  @override
  Future<ApiResponse<LoginEntity>> login(LoginRequest request)async {
    return await loginDataSource.login(request);
  }

}