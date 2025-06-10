import 'package:movie_app/features/movie_details_page/domain/movie_details_entity.dart';

abstract class MovieDetailsState{}
class InitMovieDetailsState extends MovieDetailsState{}
class MovieDetailsLoadingState extends MovieDetailsState{}
class MovieDetailsSuccessState extends MovieDetailsState
{
  final Movie? movie;
  MovieDetailsSuccessState({required this.movie});
}
class MovieDetailsErrorState extends MovieDetailsState
{
  final String? errorMessage;
  MovieDetailsErrorState({required this.errorMessage});
}