import 'package:movie_app/features/movies_page/domain/movies_entity.dart';

import '../../../core/api/api_response.dart';
import 'movie_details_entity.dart';

abstract class MovieDetailsDataSource
{
  Future<ApiResponse<MovieDetailsEntity>> getMovie(int movieId,
      {bool? withImage,bool? withCast});
  Future<ApiResponse<MoviesEntity>> getSimilarMovies(int movieId);
}