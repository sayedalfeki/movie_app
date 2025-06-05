import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/register/domain/register_data_source.dart';
import 'package:movie_app/features/auth/register/domain/register_entity.dart';
import 'package:movie_app/features/auth/register/domain/register_repository.dart';
import 'package:movie_app/features/auth/register/request_entity/register_request_entity.dart';
class RegisterRepositoryImpl extends RegisterRepository
{
   late RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});

  @override
  Future<ApiResponse<RegisterEntity>> register(RegisterRequestEntity registerRequest)async {
    return await registerDataSource.register(registerRequest);
  }
  
}