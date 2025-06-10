import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_use_case.dart';
import 'package:movie_app/features/movie_details_page/view_model/movie_details_state.dart';

class MovieDetailsViewmodel extends Cubit<MovieDetailsState>
{
  final MovieDetailsUseCase movieDetailsUseCase;
  MovieDetailsViewmodel({required this.movieDetailsUseCase}):super(InitMovieDetailsState());
  getMovie(int movieId)async
  {
    emit(MovieDetailsLoadingState());
    final response=await movieDetailsUseCase.invoke(movieId,withCast:true,
        withImage:true);
    if(response.response!=null)
    {
      emit(MovieDetailsSuccessState(movie: response.response?.data?.movie));
    }
    else
    {
      emit(MovieDetailsErrorState(errorMessage: response.error));
    }
  }

}