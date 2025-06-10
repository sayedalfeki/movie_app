import '../../../core/api/api_response.dart';
import 'movie_details_entity.dart';

abstract class MovieDetailsDataSource
{
  Future<ApiResponse<MovieDetailsEntity>> getMovie(int movieId,
      {bool? withImage,bool? withCast});
}