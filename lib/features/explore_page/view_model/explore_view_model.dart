import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';
import 'package:movie_app/features/movies_page/domain/movies_use_case.dart';
import 'explore_state.dart';

class ExploreViewModel extends Cubit<ExploreState>
{
  final MoviesUseCase moviesUseCase;

  int explorePage=1;
  String genre;
  ScrollController scrollController=ScrollController();

  ExploreViewModel(this.moviesUseCase,{required this.genre}):super(InitExploreState())
  {

      scrollController.addListener(() {
        if(scrollController.position.pixels==scrollController.position.maxScrollExtent)
        {
          getGenreMovies();
        }
      },);
  }

  getGenreMovies()async
  {
    emit(ExploreLoadingState());
    final response=await moviesUseCase.invoke(movieRequest: MoviesRequest(

        page:explorePage,
        genre: genre
    ));
    //print(response.response?.data?.limit);
    if(response.response!=null)
    {
      explorePage++;
      emit(ExploreSuccessState(movies: response.response?.data?.movies??[]));
    }
    else
    {
      emit(ExploreErrorState(errorMessage: response.error));
    }
  }

}