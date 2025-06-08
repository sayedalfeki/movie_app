import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';
import 'package:movie_app/features/movies_page/view_model/movies_view_model.dart';
import 'package:movie_app/features/search/view_model/search_view_model.dart';


import '../../../core/app_custom_widget/movie_item_widget.dart';
import '../../movies_page/data/movies_remote_dio_data_source_impl.dart';
import '../../movies_page/data/movies_repository_impl.dart';
import '../../movies_page/domain/movies_use_case.dart';
import '../view_model/search_state.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key});
   SearchViewModel searchViewModel=SearchViewModel
     (MoviesUseCase(moviesRepository:
   MoviesRepositoryImpl(moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl())));
  List<Movies> movies=[];
   @override
  Widget build(BuildContext context) {
   // movies.add('s');
    return BlocConsumer(
      bloc: searchViewModel,
      listener: (context, state) {
        if(state is MoviesSuccessState)
        {
          movies=state.movies;
        }
      },
      builder:(context, state) =>  Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              // onFieldSubmitted: (value) {
              //   searchViewModel.getSearchedMovies(value);
              // },
              onChanged: (value) {

                if(value.isEmpty)
                {
                  searchViewModel.emptySearch();
                }
                else {
                  searchViewModel.getSearchedMovies(value);

                }
              },
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'search'
              ),
            ),
           Expanded(
              child:state is SearchLoadingState?
              Center(child: CircularProgressIndicator(),):
                  state is SearchErrorState?
                  Center(child:Text(state.errorMessage??'',
                    style: AppStyles.whiteNormal15,),):
             state is SearchSuccessState?state.movies.isEmpty? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(AppAssets.splashImage),
                  ),
                ],
              ):GridView.builder(
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
