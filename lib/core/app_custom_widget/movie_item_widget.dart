import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_custom_widget/action_container_widget.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';

import '../../features/movie_details_page/domain/movie_details_entity.dart';
class MovieItemWidget extends StatelessWidget {
   MovieItemWidget({super.key,this.movieEntity,this.width=70,
   this.imageSize=20,this.fontSize=20
   });
  final double width;
   final double imageSize;
   final double fontSize;
  final DataMovieEntity? movieEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,AppRoutes.movieDetailsRoute,
            arguments:movieEntity?.id );
      },
      child: Padding(
        padding:EdgeInsets.all(4.h),
        child: Stack(
         // alignment: Alignment.topLeft,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child:
                //Image.asset(AppAssets.onBoardingImage5)
                Image.network(movieEntity?.mediumCoverImage??'',
                fit: BoxFit.cover,
                )
            ),

            Container(
              // constraints: BoxConstraints(
              //   maxWidth: width.w
              //
              // ),
              width:width.w,
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                  color: AppColor.appLightBlackColor.withAlpha(230),
                borderRadius: BorderRadius.circular(8.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${movieEntity?.rating??0}',style: AppStyles.whiteNormal15.copyWith(
                    fontSize:fontSize.sp
                  ),),
                  SizedBox(width:5.w,),
                  Icon(Icons.star_rate,color: AppColor.appYellowColor,size:imageSize.w,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
