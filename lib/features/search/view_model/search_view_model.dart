import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';
import 'package:movie_app/features/movies_page/domain/movies_use_case.dart';
import 'package:movie_app/features/search/view_model/search_state.dart';

class SearchViewModel extends Cubit<SearchState>
{
  final MoviesUseCase moviesUseCase;
  SearchViewModel(this.moviesUseCase):super(InitSearchState())
  {
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent)
      {
        getSearchedMovies(searchEditingController.text);
      }
    },);
  }
int page=1;
ScrollController scrollController=ScrollController();
TextEditingController searchEditingController=TextEditingController();
  getSearchedMovies(String search)async
  {
    emit(SearchLoadingState());
    final response=await moviesUseCase.invoke(
        movieRequest: MoviesRequest(
          page: page,
            queryTerm: search
        )
    );
    //print(response.response?.data?.limit);
    if(response.response!=null)
    {
      page++;
      emit(SearchSuccessState(movies: response.response?.data?.movies??[]));
    }
    else
    {
      emit(SearchErrorState(errorMessage: response.error));
    }
  }
  emptySearch()
  {
    emit(InitSearchState());
  }
}