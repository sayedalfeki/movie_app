import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/register/data/register_dto.dart';
import 'package:movie_app/features/auth/register/domain/register_data_source.dart';
import 'package:movie_app/features/auth/register/request_entity/register_request_entity.dart';
import '../../../../../core/api/api_endpoints.dart';

class RegisterRemoteDioDataSource extends RegisterDataSource
{
  late ApiManager apiManager;
  RegisterRemoteDioDataSource(this.apiManager);
  @override
  Future<ApiResponse<RegisterDto>> register(RegisterRequestEntity registerRequest) async
  {
    try {
      var response = await apiManager.post(
          ApiEndPoints.signUpPath, data: registerRequest.toJson());

      if(response.statusCode!>=500)
      {
        return ApiResponse(error:' server error : ${response.statusMessage}');
      }
      else
      {
        print(response.data);
        RegisterDto registerDto=RegisterDto.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300)
        {
          return ApiResponse(response: registerDto);
        }
        else
        {
          if(registerDto.statusMsg!=null)
          {
            return ApiResponse(error: 'client error: ${registerDto.message}');
          }
          return ApiResponse(error: 'client error: ${registerDto.errorDto?.msg}');
        }
      }

    }
    catch(e)
    {
      return ApiResponse(error: e.toString());
    }
  }

}