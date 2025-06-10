import 'package:movie_app/features/movie_details_page/domain/movie_details_repository.dart';

import '../../../core/api/api_response.dart';
import 'movie_details_entity.dart';

class MovieDetailsUseCase
{
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsUseCase({required this.movieDetailsRepository});
  Future<ApiResponse<MovieDetailsEntity>> invoke(int movieId,
      {bool? withImage,bool? withCast})async
  {
    return await movieDetailsRepository.getMovie(movieId,withImage: withImage,withCast: withCast);
  }
}