import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.moviePosterImage)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios,color: AppColor.appWhiteColor,),
              Icon(Icons.bookmark,color: AppColor.appWhiteColor,),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Icon(Icons.play_circle,size: 30,color: AppColor.appYellowColor,),),
              ],
            ),
          ),
          Text('doctor strange in the multiverse of madness',
          style: AppStyles.whiteBold24,
          ),
          Center(child: Text('2022',style: AppStyles.whiteNormal15,),)
        ],
      ),
    );
  }
}
