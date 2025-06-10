import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/explore_page/view/explore_item_widget.dart';
import 'package:movie_app/features/explore_page/view/explore_tabs_widget.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';
import '../../../core/app_custom_widget/error_widget.dart';
import '../../../core/app_custom_widget/loading_widget.dart';
import '../../movies_page/data/movies_remote_dio_data_source_impl.dart';
import '../../movies_page/data/movies_repository_impl.dart';
import '../../movies_page/domain/movies_use_case.dart';
import '../../movies_page/view_model/movies_view_model.dart';
class ExplorePage extends StatelessWidget {

List<String> genres=[];

  MoviesViewModel moviesViewModel=MoviesViewModel
    (MoviesUseCase(moviesRepository:
  MoviesRepositoryImpl(moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl())));
  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer(
      bloc: moviesViewModel..getAllMovies(limit:150),
      listener: (context, state) {
        if(state is MoviesSuccessState)
        {
          genres=moviesViewModel.fillGenreList(state.movies);

        }

      },
      builder:(context, state) =>  Padding(
        padding: const EdgeInsets.all(16.0),
        child:genres.isNotEmpty?
        Column(
          children: [
            genres.isNotEmpty?DefaultTabController(
             length:genres.length,
             initialIndex: moviesViewModel.selectedTabIndex,
             child: TabBar(
               //physics: AlwaysScrollableScrollPhysics(),
               onTap: (value) {
                 moviesViewModel.changeSelectedTabIndex(value);
                // movies.clear();
                // moviesViewModel.getGenreMovies(genres[moviesViewModel.selectedTabIndex]);


               },
               isScrollable: true,
                 tabAlignment: TabAlignment.start,
                 labelPadding: EdgeInsets.zero,
                 dividerColor: Colors.transparent,
                 indicatorColor: Colors.transparent,
                 tabs:genres.map((e) {
               return ExploreTabsWidget(isSelected:
                   genres.indexOf(e)==moviesViewModel.selectedTabIndex,
                    text:e);
             },).toList()),
           ):Center(child: Text('no genres available'),),
            SizedBox(height: 10,),
            ExploreItemWidget(genre: genres[moviesViewModel.selectedTabIndex],)
          ],
        ):
        state is MoviesLoadingState?
        LoadingWidget():
        state is MoviesErrorState?
        AppErrorWidget(errorMessage:state.errorMessage??'',
        onPressed: () {
          moviesViewModel.getAllMovies(limit:150);
        },
        ):

        Container(),
      ),
    );
  }
}
