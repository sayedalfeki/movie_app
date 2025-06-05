import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/register/domain/register_entity.dart';
import 'package:movie_app/features/auth/register/domain/register_repository.dart';
import 'package:movie_app/features/auth/register/request_entity/register_request_entity.dart';

class RegisterUseCase
{
  final RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  Future<ApiResponse<RegisterEntity>> invoke(RegisterRequestEntity registerRequest)async{
     return registerRepository.register(registerRequest);
  }
}