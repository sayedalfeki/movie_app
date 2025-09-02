import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_response.dart';
import 'package:movie_app/features/movies_page/data/movies_dto.dart';
import 'package:movie_app/features/movies_page/domain/movies_data_source_repository.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';

import '../../../core/api/movies_api_manager.dart';

class MoviesRemoteDioDataSourceImpl extends MoviesDataSourceRepository
{
  @override
  Future<ApiResponse<MoviesDto>> getAllMovies({MoviesRequest? movieRequest}) async{
    try
    {
      final response=await MoviesApiManager.instance.get(ApiEndPoints.listMoviesPath,
      queryParams: movieRequest?.toJson()
      );
      if(response.statusCode!>=500)
      {
        return ApiResponse(error:'server error : ${ response.statusMessage}');
      }
      if(response.statusCode!<=400&&response.statusCode!>300)
      {
        return ApiResponse(error: 'client error : ${response.statusMessage}');
      }
      //print(response.data);
      MoviesDto moviesDto=MoviesDto.fromJson(response.data);
      //print(moviesDto.dataDto?.moviesDto);
      return ApiResponse(
        response: moviesDto
      );

    }catch(e)
    {
      return ApiResponse(error: 'exception : ${e.toString()}');
    }
  }

}