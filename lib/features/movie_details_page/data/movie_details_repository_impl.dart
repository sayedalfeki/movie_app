import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_data_source.dart';

import 'package:movie_app/features/movie_details_page/domain/movie_details_entity.dart';

import '../domain/movie_details_repository.dart';

class MovieDetailsRepositoryImpl extends MovieDetailsRepository
{
  final MovieDetailsDataSource movieDetailsDataSource;

  MovieDetailsRepositoryImpl({required this.movieDetailsDataSource});
  @override
  Future<ApiResponse<MovieDetailsEntity>> getMovie(int movieId,
      {bool? withImage, bool? withCast})async {
    return await movieDetailsDataSource.getMovie(movieId,withImage: withImage,withCast: withCast);
  }

}