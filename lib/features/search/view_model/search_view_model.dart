import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies_page/domain/movies_request.dart';
import 'package:movie_app/features/movies_page/domain/movies_use_case.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';
import 'package:movie_app/features/search/view_model/search_state.dart';

class SearchViewModel extends Cubit<SearchState>
{
  final MoviesUseCase moviesUseCase;
  SearchViewModel(this.moviesUseCase):super(InitSearchState());

  getSearchedMovies(String search)async
  {
    emit(SearchLoadingState());
    final response=await moviesUseCase.invoke(
        movieRequest: MoviesRequest(
            queryTerm: search
        )
    );
    //print(response.response?.data?.limit);
    if(response.response!=null)
    {
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