import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/explore_page/view_model/explore_view_model.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';
import 'package:movie_app/features/movies_page/view_model/movies_view_model.dart';
import '../../../core/app_custom_widget/movie_item_widget.dart';
import '../../explore_page/view_model/explore_state.dart';
import '../data/movies_remote_dio_data_source_impl.dart';
import '../data/movies_repository_impl.dart';
import '../domain/movies_use_case.dart';
class WatchNowWidget extends StatelessWidget {
   WatchNowWidget({super.key,required this.movieType});
  final String movieType;

  @override
  Widget build(BuildContext context) {
    ExploreViewModel exploreViewModel=ExploreViewModel
      (MoviesUseCase(moviesRepository:
    MoviesRepositoryImpl(moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl()))
        ,genre: movieType);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(movieType,style: AppStyles.whiteNormal15,),
            Row(children: [Text('see more',style: AppStyles.yellowRoboto14,),
              Icon(Icons.arrow_forward,color: AppColor.appYellowColor,)],)
          ],
        ),
        SizedBox(height: 15,),
        BlocBuilder(
          bloc:exploreViewModel..getGenreMovies() ,
        builder:(context, state) => state is ExploreLoadingState?
    Center(child: CircularProgressIndicator(),):
            state is ExploreErrorState?
    Center(child: Text(state.errorMessage??'',style: AppStyles.whiteNormal15,),):
                state is ExploreSuccessState?
    Expanded(
            child: Container(
              height:200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:state.movies.length,
                itemBuilder: (context, index) {
                return MovieItemWidget(
                movieEntity: state.movies[index],
                );
              },),
            ),
          ):Container(),
        )
      ],
    );
  }
}
