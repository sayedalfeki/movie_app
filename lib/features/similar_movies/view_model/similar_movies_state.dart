import '../../movies_page/domain/movies_entity.dart';

abstract class SimilarMoviesState{}
class InitSimilarMoviesState extends SimilarMoviesState{}
class SimilarMoviesLoadingState extends SimilarMoviesState{}
class SimilarMoviesSuccessState extends SimilarMoviesState
{

  final List<Movies>? movies;
  SimilarMoviesSuccessState({ this.movies});
}
class SimilarMoviesErrorState extends SimilarMoviesState
{
  final String? errorMessage;
  SimilarMoviesErrorState({required this.errorMessage});
}