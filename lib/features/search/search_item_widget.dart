import 'package:flutter/material.dart';
import 'package:movie_app/core/action_container_widget.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(AppAssets.onBoardingImage1)),

          Container(
            width:70,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppColor.appLightBlackColor.withAlpha(230),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('7.7',style: AppStyles.whiteNormal15.copyWith(
                  fontSize: 20
                ),),
                SizedBox(width: 5,),
                Icon(Icons.star_rate,color: AppColor.appYellowColor,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
