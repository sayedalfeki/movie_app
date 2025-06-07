import '../../../core/api/api_response.dart';
import 'movies_entity.dart';
import 'movies_request.dart';

abstract class MoviesDataSourceRepository
{
  Future<ApiResponse<MoviesEntity>> getAllMovies({MoviesRequest? movieRequest});

}