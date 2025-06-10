import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/core/api/movies_api_manager.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_data_source.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_entity.dart';

import '../../../core/api/api_endpoints.dart';

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsDataSource
{
  final MoviesApiManager moviesApiManager;

  MovieDetailsRemoteDataSourceImpl({required this.moviesApiManager});
  @override
  Future<ApiResponse<MovieDetailsEntity>> getMovie(int movieId,
      {bool? withImage,bool? withCast})async
  {
    try
    {
      final response=await moviesApiManager.get(ApiEndPoints.movieDetailsPath,
      queryParams: {
        'movie_id':movieId,
        'with_images':withImage,
        'with_cast':withCast
      }
      );
      if(response.statusCode!>=500)
      {
        return ApiResponse(error:'server error : ${ response.statusMessage}');
      }
      if(response.statusCode!<=400&&response.statusCode!>300)
      {
        return ApiResponse(error: 'client error : ${response.statusMessage}');
      }
      MovieDetailsEntity movieDetailsEntity=MovieDetailsEntity.fromJson(response.data);
      print(response.data);
      return ApiResponse(response: movieDetailsEntity);
    }catch(e)
    {
      return ApiResponse(error: e.toString());
    }
  }
}