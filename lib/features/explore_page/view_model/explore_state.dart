import '../../movies_page/domain/movies_entity.dart';

abstract class ExploreState{}
class InitExploreState extends ExploreState{}
class ExploreLoadingState extends ExploreState{}
class ExploreSuccessState extends ExploreState{
  final List<DataMovieEntity> movies;

  ExploreSuccessState({required this.movies});

}
class ExploreErrorState extends ExploreState{
  final String? errorMessage;

  ExploreErrorState({required this.errorMessage});
}