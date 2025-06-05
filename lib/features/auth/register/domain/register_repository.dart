import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/register/domain/register_entity.dart';
import 'package:movie_app/features/auth/register/request_entity/register_request_entity.dart';

abstract class RegisterRepository
{
  Future<ApiResponse<RegisterEntity>> register(RegisterRequestEntity registerRequest);
}