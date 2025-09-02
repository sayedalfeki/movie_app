import 'package:movie_app/features/movies_page/domain/movies_entity.dart';

abstract class SearchState{}
class InitSearchState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchSuccessState extends SearchState{
 final List<DataMovieEntity> movies;

  SearchSuccessState({required this.movies});

}
class SearchErrorState extends SearchState{
  final String? errorMessage;

  SearchErrorState({required this.errorMessage});

}
