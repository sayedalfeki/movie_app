import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';

import '../../../../core/api/api_response.dart';
import '../domain/forget_password_data_source.dart';
import '../domain/forget_password_entity.dart';

class ForgetPassWordRemoteDataSourceImp extends ForgetPassWordDataSource {
  ApiManager apiManager;

  ForgetPassWordRemoteDataSourceImp(this.apiManager);

  @override
  Future<ApiResponse<ForgetPassWordEntity>> forgetPassword(String email) async {
    try {
      final response = await apiManager.post(
        ApiEndPoints.forgetPasswordPath,
        data: {'email': email},
      );
      if (response.statusCode! >= 500) {
        return ApiResponse(error: 'server error:${response.statusMessage}');
      } else {
        ForgetPassWordEntity forgetPassWordEntity =
            ForgetPassWordEntity.fromJson(response.data);
        if (forgetPassWordEntity.statusMessage == 'fail') {
          return ApiResponse(error: forgetPassWordEntity.message);
        }
        return ApiResponse(response: forgetPassWordEntity);
      }
    } catch (e) {
      return ApiResponse(error: 'exception :${e.toString()}');
    }
  }

  @override
  Future<ApiResponse<ForgetPassWordEntity>> resetCode(String code) async {
    try {
      final response = await apiManager.post(
        ApiEndPoints.resetCodePath,
        data: {'resetCode': code},
      );
      if (response.statusCode! >= 500) {
        return ApiResponse(error: 'server error:${response.statusMessage}');
      } else {
        ForgetPassWordEntity forgetPassWordEntity =
            ForgetPassWordEntity.fromJson(response.data);
        if (forgetPassWordEntity.statusMessage == 'fail') {
          return ApiResponse(error: forgetPassWordEntity.message);
        }
        return ApiResponse(response: forgetPassWordEntity);
      }
    } catch (e) {
      return ApiResponse(error: 'exception :${e.toString()}');
    }
  }

  @override
  Future<ApiResponse<ForgetPassWordEntity>> changePassword(
    String email,
    String newPassword,
  ) async{
    try {
      final response = await apiManager.put(
        ApiEndPoints.changePasswordPath,
        data: {'email':email,'newPassword':newPassword},
      );
      if (response.statusCode! >= 500) {
        return ApiResponse(error: 'server error:${response.statusMessage}');
      } else {
        ForgetPassWordEntity forgetPassWordEntity =
        ForgetPassWordEntity.fromJson(response.data);
        if (forgetPassWordEntity.statusMessage == 'fail') {
          return ApiResponse(error: forgetPassWordEntity.message);
        }
        return ApiResponse(response: forgetPassWordEntity);
      }
    } catch (e) {
      return ApiResponse(error: 'exception :${e.toString()}');
    }
  }
}
