import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_state.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_view_model.dart';

import '../../../core/api/movies_api_manager.dart';
import '../../../core/app_custom_widget/movie_item_widget.dart';
import '../../movie_details_page/data/movie_details_remote_data_source_impl.dart';
import '../../movie_details_page/data/movie_details_repository_impl.dart';
import '../../movie_details_page/domain/movie_details_use_case.dart';
class SimilarMovieWidget extends StatelessWidget {
   SimilarMovieWidget({super.key,required this.movieId});
  final int movieId;
 final SimilarMoviesViewmodel similarMoviesViewmodel=SimilarMoviesViewmodel(
      movieDetailsUseCase:MovieDetailsUseCase
        (movieDetailsRepository: MovieDetailsRepositoryImpl
        (movieDetailsDataSource:MovieDetailsRemoteDataSourceImpl
        (moviesApiManager:MoviesApiManager.instance))));
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesViewmodel,SimilarMoviesState>(
      bloc: similarMoviesViewmodel..getSimilarMovies(movieId),
        builder:(context, state) =>
            state is SimilarMoviesLoadingState?
      Center(child: CircularProgressIndicator(),):
                state is SimilarMoviesErrorState?
      Center(child: Text(state.errorMessage??'',style: AppStyles.whiteNormal15,),):
                    state is SimilarMoviesSuccessState?
            Container(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('similar',style: AppStyles.whiteBold24,),
            SizedBox(height: 10,),
        Expanded(child:ListView.builder(
          scrollDirection:Axis.horizontal,
          itemCount:state.movies?.length,
          itemBuilder:(context, index) {
            return MovieItemWidget(movieEntity: state.movies?[index],);
          },))
          ],
        ),
      ):Center(child: Text('no similar movies'),),
    );
  }
}
