import '../../../core/api/api_response.dart';
import '../../movies_page/domain/movies_entity.dart';
import 'movie_details_entity.dart';

abstract class MovieDetailsRepository
{
  Future<ApiResponse<MovieDetailsEntity>> getMovie(int movieId,
      {bool? withImage,bool? withCast});
  Future<ApiResponse<MoviesEntity>> getSimilarMovies(int movieId);

}