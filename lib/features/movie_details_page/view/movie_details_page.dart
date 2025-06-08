import 'package:flutter/material.dart';
import 'package:movie_app/core/app_custom_widget/action_container_widget.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movie_details_page/view/movie_cast_widget.dart';
import 'package:movie_app/features/movie_details_page/view/movie_genres_widget.dart';
import 'package:movie_app/features/movie_details_page/view/movie_poster_widget.dart';
import 'package:movie_app/features/movie_details_page/view/screen_shots_widget.dart';
import 'package:movie_app/features/movie_details_page/view/similar_movie_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height:700,
                  child: MoviePosterWidget()),
              ElevatedButton(
                  style: Theme.of(context).
                  elevatedButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStatePropertyAll(AppColor.appRedColor)
                  ),
                  onPressed: (){},
                  child:Text('watch',style: AppStyles.whiteNormal15,)),
              Row(
                children: [
                 Expanded(child: ActionContainerWidget(data: '15', icon:Icons.heart_broken)),
                  Expanded(child: ActionContainerWidget(data: '90', icon:Icons.watch_later)),
                  Expanded(child: ActionContainerWidget(data: '76', icon:Icons.star)),
                ],
              ),
              Container(
                height: 300,
                child: ScreenShotsWidget(),
              ),
              SizedBox(height: 10,),
              SimilarMovieWidget(),
              Text('summary',style: AppStyles.whiteBold24,),
              SizedBox(height: 10,),
              Container(
                //height: 100,
                child: Text(
                  softWrap: true,
                  'kgkgggjfhgdfdgfdhgjvjhvmnvbnvhchdfgsgfxfxfxgsgxvcxf'
                    'chkgcjlchcghchgcgjjl;lkl;kl;k;ytgfddxkjhtrddghghhgh',
                style: AppStyles.whiteNormal15,
                ),
              ),
              SizedBox(height: 10,),
              MovieCastWidget(),
              SizedBox(height: 10,),
              MovieGenresWidget()
            ],
          ),
        ),
      ),
    );
  }
}
