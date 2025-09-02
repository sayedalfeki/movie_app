import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_custom_widget/error_widget.dart';
import 'package:movie_app/core/app_custom_widget/loading_widget.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/explore_page/view_model/explore_state.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
import '../../../core/app_custom_widget/movie_item_widget.dart';
import '../../movies_page/data/movies_remote_dio_data_source_impl.dart';
import '../../movies_page/data/movies_repository_impl.dart';
import '../../movies_page/domain/movies_use_case.dart';
import '../view_model/explore_view_model.dart';

class ExploreItemWidget extends StatelessWidget {
   ExploreItemWidget({super.key,required this.genre});
  String genre;
  List<DataMovieEntity> movies=[];
  @override
  Widget build(BuildContext context) {
    ExploreViewModel exploreViewModel=ExploreViewModel
      (MoviesUseCase(moviesRepository:
    MoviesRepositoryImpl(moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl()))
        ,genre:genre);
    return BlocConsumer<ExploreViewModel,ExploreState>(
      bloc: exploreViewModel..getGenreMovies(),
      listener: (context, state) {
        if(state is ExploreSuccessState)
        {
          state.movies.forEach((element) {
            movies.add(element);
          },);
        }
      },
      builder:(context, state) =>
      movies.isNotEmpty?
          Expanded(
        child: movies.isNotEmpty?
        GridView.builder(
          controller:exploreViewModel.scrollController,
          itemCount:movies.length,
          itemBuilder: (context,index) {
            return index>=movies.length-1?LoadingWidget():
            MovieItemWidget(
              movieEntity:movies[index],
            );
          },
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount: 2,
              childAspectRatio: 2/3,
              //crossAxisSpacing: 5,
              mainAxisSpacing: 5
          ),
        ):Container(),
      ):
      state is ExploreLoadingState?LoadingWidget():
      state is ExploreErrorState?AppErrorWidget(errorMessage:state.errorMessage??''
      ,onPressed: () {
          exploreViewModel.getGenreMovies();
      },
      ):Container(),
    );
  }
}
