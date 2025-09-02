import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/auth/login/data/login_dto.dart';
import 'package:movie_app/features/auth/login/domain/login_data_source.dart';
import 'package:movie_app/features/auth/login/domain/login_entity.dart';
import 'package:movie_app/features/auth/login/domain/login_request_entity.dart';

import '../../../../../core/api/api_endpoints.dart';

class LoginRemoteDataSourceDioImp extends LoginDataSource
{
  late ApiManager apiManager;

  LoginRemoteDataSourceDioImp(this.apiManager);

  @override
  Future<ApiResponse<LoginDto>> login(LoginRequest request) async
  {
    try {
      var response = await apiManager.post(
          ApiEndPoints.signInPath, data:request.toJson());

      if(response.statusCode!>=500)
      {
        return ApiResponse(error:' server error : ${response.statusMessage}');
      }
      else
      {
        print(response.data);
        LoginDto loginDto=LoginDto.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300)
        {
          return ApiResponse(response:loginDto);
        }
        else
        {
          if(loginDto.statusMsg!=null)
          {
            return ApiResponse(error: 'client error: ${loginDto.message}');
          }
          return ApiResponse(error: 'client error: ${loginDto.errors?.msg}');
        }
      }

    }
    catch(e)
    {
      return ApiResponse(error: e.toString());
    }
  }

}