import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/movies_page/domain/movies_data_source_repository.dart';

import 'package:movie_app/features/movies_page/domain/movies_entity.dart';

import 'package:movie_app/features/movies_page/domain/movies_request.dart';

import '../domain/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository
{
  final MoviesDataSourceRepository moviesDataSourceRepository;

  MoviesRepositoryImpl({required this.moviesDataSourceRepository});
  @override
  Future<ApiResponse<MoviesEntity>> getAllMovies({MoviesRequest? movieRequest}) async {
   return await moviesDataSourceRepository.getAllMovies(movieRequest: movieRequest);
  }

}