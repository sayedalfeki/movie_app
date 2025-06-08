import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_assets.dart';

import 'package:movie_app/features/explore_page/explore_tabs_widget.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';


import '../../core/app_custom_widget/movie_item_widget.dart';
import '../movies_page/data/movies_remote_dio_data_source_impl.dart';
import '../movies_page/data/movies_repository_impl.dart';
import '../movies_page/domain/movies_use_case.dart';
import '../movies_page/view_model/movies_view_model.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  //List<String> movies=['action','adventure','animation','comedy','documentary'];
List<String> genres=[];
  int selectedTabIndex=0;
  MoviesViewModel moviesViewModel=MoviesViewModel
    (MoviesUseCase(moviesRepository:
  MoviesRepositoryImpl(moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl())));
  @override
  Widget build(BuildContext context) {
   // movies.add('s');
    return BlocConsumer(
      bloc: moviesViewModel,
      listener: (context, state) {
        if(state is MoviesSuccessState)
        {
          genres=moviesViewModel.fillGenreList(state.movies);
          moviesViewModel.getGenreMovies(genres[selectedTabIndex]);
        }
      },
      builder:(context, state) =>  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           DefaultTabController(
             length:genres.length,
             initialIndex: selectedTabIndex,
             child: TabBar(
               //physics: AlwaysScrollableScrollPhysics(),
               onTap: (value) {
                 selectedTabIndex=value;
                 moviesViewModel.getGenreMovies(genres[selectedTabIndex]);

                 setState(() {

                 });
               },
               isScrollable: true,
                 tabAlignment: TabAlignment.start,
                 labelPadding: EdgeInsets.zero,
                 dividerColor: Colors.transparent,
                 indicatorColor: Colors.transparent,
                 tabs:genres.map((e) {
               return ExploreTabsWidget(isSelected:
                   genres.indexOf(e)==selectedTabIndex,
                    text:e);
             },).toList()),
           ),
            SizedBox(height: 10,),
            Expanded(
              child:genres.isEmpty? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(AppAssets.splashImage),
                  ),
                ],
              ):state is MoviesGenreSuccessState?GridView.builder(
                itemCount:state.movies.length,
                itemBuilder: (context,index) {
                  return MovieItemWidget(
                    movieEntity: state.movies[index],
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
            )
          ],
        ),
      ),
    );
  }
}
