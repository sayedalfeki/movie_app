import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';
import 'package:movie_app/features/movies_page/domain/movies_use_case.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';

import '../domain/movies_entity.dart';

class MoviesViewModel extends Cubit<MoviesState>
{
  final MoviesUseCase moviesUseCase;
  int page=1;
  int selectedTabIndex=0;
  int selectedIndex=0;
  int explorePage=1;
  MoviesViewModel(this.moviesUseCase):super(InitMoviesState())
  {
   // getAllMovies();
  }
  changeSelectedIndex(int value)
  {
    selectedIndex=value;
    emit(ChangeIndexMoviesState());
  }
  changeSelectedTabIndex(int value)
  {
    selectedTabIndex=value;
    explorePage=1;
    emit(ChangeIndexMoviesState());
  }
  getAllMovies({int limit=10,String? search})async
  {
    emit(MoviesLoadingState());
    final response=await moviesUseCase.invoke(
      movieRequest: MoviesRequest(
        limit:limit,
        page: page,
        queryTerm: search
      )
    );
    //print(response.response?.data?.limit);
    if(response.response!=null)
    {
      page++;
      emit(MoviesSuccessState(movies: response.response?.data?.movies??[]));
    }
    else
    {
      emit(MoviesErrorState(errorMessage: response.error));
    }
  }

  List<String> fillGenreList(List<Movies> movies)
  {

    List<String> genre=[];
    movies.forEach((element) {
      if(genre.isEmpty)
      {
        genre.add(element.genres?[0]??'');

      }
      else
      {
        if(!genre.contains(element.genres?[0])) {
          print(genre[0]);
          genre.add(element.genres?[0] ?? '');
        }
      }
    },);
    //emit(ChangeIndexMoviesState());
    return genre;
  }
}