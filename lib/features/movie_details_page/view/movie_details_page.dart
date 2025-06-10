import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/movies_api_manager.dart';
import 'package:movie_app/core/app_custom_widget/action_container_widget.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movie_details_page/data/movie_details_remote_data_source_impl.dart';
import 'package:movie_app/features/movie_details_page/data/movie_details_repository_impl.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_use_case.dart';
import 'package:movie_app/features/movie_details_page/view/movie_cast_widget.dart';
import 'package:movie_app/features/movie_details_page/view/movie_genres_widget.dart';
import 'package:movie_app/features/movie_details_page/view/movie_poster_widget.dart';
import 'package:movie_app/features/movie_details_page/view/screen_shots_widget.dart';
import 'package:movie_app/features/similar_movies/view/similar_movie_widget.dart';
import 'package:movie_app/features/movie_details_page/view_model/movie_details_state.dart';
import 'package:movie_app/features/movie_details_page/view_model/movie_details_view_model.dart';

import '../../../core/app_custom_widget/error_widget.dart';
import '../../../core/app_custom_widget/loading_widget.dart';

class MovieDetailsPage extends StatelessWidget {
   MovieDetailsPage({super.key});
final MovieDetailsViewmodel movieDetailsViewmodel=MovieDetailsViewmodel
  (movieDetailsUseCase:MovieDetailsUseCase
  (movieDetailsRepository: MovieDetailsRepositoryImpl
  (movieDetailsDataSource:MovieDetailsRemoteDataSourceImpl
  (moviesApiManager:MoviesApiManager.instance))));
  @override
  Widget build(BuildContext context) {
    int movieId=ModalRoute.of(context)?.settings.arguments as int;
    return BlocConsumer(
      bloc: movieDetailsViewmodel..getMovie(movieId),
      listener: (context, state) {

      },
      builder:(context, state) =>  Scaffold(
        body: SafeArea(
          child: state is MovieDetailsLoadingState?
          LoadingWidget():
              state is MovieDetailsErrorState?
          AppErrorWidget(errorMessage: state.errorMessage??'',
          onPressed: () {
            movieDetailsViewmodel.getMovie(movieId);
          },
          ):
          state is MovieDetailsSuccessState?
          state.movie!=null?
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height:700,
                      child: MoviePosterWidget(movie: state.movie!,)),
                  ElevatedButton(
                      style: Theme.of(context).
                      elevatedButtonTheme.style?.copyWith(
                        backgroundColor: WidgetStatePropertyAll(AppColor.appRedColor)
                      ),
                      onPressed: (){},
                      child:Text('watch',style: AppStyles.whiteNormal15,)),
                  Row(
                    children: [
                     Expanded(child: ActionContainerWidget(data:'${state.movie?.likeCount}', icon:Icons.heart_broken)),
                      Expanded(child: ActionContainerWidget(data: '${state.movie?.runtime}', icon:Icons.watch_later)),
                      Expanded(child: ActionContainerWidget(data: '${state.movie?.rating}', icon:Icons.star)),
                    ],
                  ),
                  Container(
                    height: 300,
                    child: ScreenShotsWidget(
                      images:[state.movie?.largeScreenshotImage1,
                        state.movie?.largeScreenshotImage2,
                        state.movie?.largeScreenshotImage3
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SimilarMovieWidget(movieId: movieId,),
                  Text('summary',style: AppStyles.whiteBold24,),
                  SizedBox(height: 10,),
                  Text(
                    '${state.movie?.descriptionFull}',
                    softWrap: true,

                  style: AppStyles.whiteNormal15,
                  ),
                  SizedBox(height: 10,),
                  MovieCastWidget(casts:state.movie?.cast??[],),
                  SizedBox(height: 10,),
                  MovieGenresWidget(genres:state.movie?.genres??[],)
                ],
              ),
            ),
          ):Center(child: Text('no movie founded'),):Container()
        )
      ),
    );
  }
}
