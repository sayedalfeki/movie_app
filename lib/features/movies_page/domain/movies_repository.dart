import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';

abstract class MoviesRepository
{
  Future<ApiResponse<MoviesEntity>> getAllMovies({MoviesRequest? movieRequest});
}