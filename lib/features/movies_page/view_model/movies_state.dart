import 'package:movie_app/features/movies_page/domain/movies_entity.dart';

abstract class MoviesState{}
class InitMoviesState extends MoviesState{}
class MoviesLoadingState extends MoviesState{}
class MoviesSuccessState extends MoviesState{
  final List<Movies> movies;

  MoviesSuccessState({required this.movies});

}
class MoviesErrorState extends MoviesState{
  final String? errorMessage;

  MoviesErrorState({required this.errorMessage});
}
class ChangeIndexMoviesState extends MoviesState{}
