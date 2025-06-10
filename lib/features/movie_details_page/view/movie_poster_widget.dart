import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_entity.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({super.key,required this.movie});
final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(movie.largeCoverImage??'')
            //AssetImage(AppAssets.moviePosterImage)
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,color: AppColor.appWhiteColor,)),
              Icon(Icons.bookmark,color: AppColor.appWhiteColor,),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Icon(Icons.play_circle,
                  size:70.sp,color: AppColor.appYellowColor,),),
              ],
            ),
          ),
          Text(movie.title??'',
          style: AppStyles.whiteBold24,
          ),
          Center(child: Text('${movie.year}',style: AppStyles.whiteNormal15,),)
        ],
      ),
    );
  }
}
