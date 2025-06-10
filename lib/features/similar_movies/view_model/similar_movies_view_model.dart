import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_state.dart';

import '../../movie_details_page/domain/movie_details_use_case.dart';

class SimilarMoviesViewmodel extends Cubit<SimilarMoviesState>
{
  final MovieDetailsUseCase movieDetailsUseCase;
  SimilarMoviesViewmodel({required this.movieDetailsUseCase}):super(InitSimilarMoviesState());

  getSimilarMovies(int movieId)async
  {
    emit(SimilarMoviesLoadingState());
    final response=await movieDetailsUseCase.getSimilarMovies(movieId);
    if(response.response!=null)
    {
      emit(SimilarMoviesSuccessState(movies: response.response?.data?.movies));
    }
    else
    {
      emit(SimilarMoviesErrorState(errorMessage: response.error));
    }
  }
}