import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_custom_widget/loading_widget.dart';
import 'package:movie_app/features/movies_page/data/movies_remote_dio_data_source_impl.dart';
import 'package:movie_app/features/movies_page/data/movies_repository_impl.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
import 'package:movie_app/features/movies_page/domain/movies_use_case.dart';
import 'package:movie_app/features/movies_page/view/watch_now_widget.dart';
import 'package:movie_app/features/movies_page/view_model/movies_state.dart';
import 'package:movie_app/features/movies_page/view_model/movies_view_model.dart';
import '../../../core/app_custom_widget/error_widget.dart';
import '../../../core/app_styles.dart';
import '../../../core/app_custom_widget/movie_item_widget.dart';

class AvailableNowWidget extends StatelessWidget {
   AvailableNowWidget({super.key});
   List<String> images=[AppAssets.onBoardingImage1,AppAssets.onBoardingImage2,
     AppAssets.onBoardingImage3];

   MoviesViewModel moviesViewModel=MoviesViewModel
     (MoviesUseCase(moviesRepository:
   MoviesRepositoryImpl(moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl())));


List<Movies> movies=[];
   @override
  Widget build(BuildContext context) {

    return BlocConsumer<MoviesViewModel,MoviesState>(
      bloc: moviesViewModel..getAllMovies(),
      listener: (context, state) {
        if(state is MoviesSuccessState)
        {
          state.movies.forEach((element) {
            movies.add(element);
          },);
        }
      },
      builder:(context, state) =>
      movies.isNotEmpty?
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                  //AssetImage(images[0])
                  NetworkImage(movies[moviesViewModel.selectedIndex].largeCoverImage!)
              )
            ),
            child: Column(
              children: [
                Text('Available Now',style:GoogleFonts.abhayaLibre(
                  color: AppColor.appWhiteColor,
                  fontSize: 35
                ),),
                SizedBox(height: 20,),
               CarouselSlider.builder(

                   itemCount:movies.length,
                   itemBuilder:(context, index, realIndex) {
                     return index>=movies.length-1?
                     Center(child: CircularProgressIndicator(),):
                     GestureDetector(
                         onTap: () {
                           Navigator.pushNamed(context,AppRoutes.movieDetailsRoute);
                         },
                         child: Card(
                           color: Colors.transparent,
                           elevation: 50,
                           child:MovieItemWidget(
                             movieEntity:movies[index],
                           ),
                         ));
                   },
                   options:CarouselOptions(
                     onPageChanged: (index, reason) {
                       print('page index=$index & movies length is : ${movies.length}');
                       if(index>=movies.length-1)
                       {
                         moviesViewModel.getAllMovies();
                       }
                       moviesViewModel.changeSelectedIndex(index);
                       //if(index)

                     },
                     // onScrolled: (value) {
                     //   print(value);
                     // },
                     initialPage:moviesViewModel.selectedIndex ,
                     height: 400,
                     enlargeCenterPage: true,
                     viewportFraction: .6
                   )),
                Text('Watch Now',style:GoogleFonts.abhayaLibre(
                    color: AppColor.appWhiteColor,
                    fontSize: 35
                ),),
               //Expanded(child: WatchNowWidget(movieType: movies[moviesViewModel.selectedIndex].genres?[0]??''))
              ],
            ),
          ),
          SizedBox(height: 15,),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: WatchNowWidget(movieType: movies[moviesViewModel.selectedIndex].genres?[0]??''),
          ))
        ],
      ):
      state is MoviesLoadingState?
      LoadingWidget():state is MoviesErrorState?
      AppErrorWidget(errorMessage: state.errorMessage??'',
      onPressed:() {
        moviesViewModel.getAllMovies();
      },
      ):
      Center(child: Text('no movies available',style: AppStyles.whiteNormal15,),),
    );
  }
}
