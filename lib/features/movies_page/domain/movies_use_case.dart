import 'package:movie_app/features/movies_page/domain/movies_repository.dart';

import '../../../core/api/api_response.dart';
import 'movies_entity.dart';
import 'movies_request.dart';

class MoviesUseCase
{
  MoviesRepository moviesRepository;
  MoviesUseCase({required this.moviesRepository});
  Future<ApiResponse<MoviesEntity>> invoke({MoviesRequest? movieRequest})async
  {
    return await moviesRepository.getAllMovies(movieRequest: movieRequest);
  }

}