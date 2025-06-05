import 'package:movie_app/features/auth/register/domain/register_entity.dart';

import '../../../../core/api/api_response.dart';
import '../request_entity/register_request_entity.dart';

abstract class RegisterDataSource
{
  Future<ApiResponse<RegisterEntity>> register(RegisterRequestEntity registerRequest);
}