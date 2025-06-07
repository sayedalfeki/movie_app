import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';
import 'package:movie_app/features/movies_page/domain/movies_use_case.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';

class MoviesViewModel extends Cubit<MoviesState>
{
  final MoviesUseCase moviesUseCase;
  MoviesViewModel(this.moviesUseCase):super(InitMoviesState())
  {
    getAllMovies();
  }
  int selectedIndex=0;
  changeSelectedIndex(int value)
  {
    selectedIndex=value;
    emit(ChangeIndexMoviesState());
  }
  getAllMovies()async
  {
    emit(MoviesLoadingState());
    final response=await moviesUseCase.invoke();
    //print(response.response?.data?.limit);
    if(response.response!=null)
    {
      emit(MoviesSuccessState(movies: response.response?.data?.movies??[]));
    }
    else
    {
      emit(MoviesErrorState(errorMessage: response.error));
    }
  }
  getGenreMovies(String genre)async
  {
    emit(MoviesGenreLoadingState());
    final response=await moviesUseCase.invoke(movieRequest: MoviesRequest(
      genre: genre
    ));
    //print(response.response?.data?.limit);
    if(response.response!=null)
    {
      emit(MoviesGenreSuccessState(movies: response.response?.data?.movies??[]));
    }
    else
    {
      emit(MoviesGenreErrorState(errorMessage: response.error));
    }
  }
}