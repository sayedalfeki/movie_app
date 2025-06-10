import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_custom_widget/action_container_widget.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key,this.movieEntity});
  final Movies? movieEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,AppRoutes.movieDetailsRoute,
            arguments:movieEntity?.id );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                //Image.asset(AppAssets.onBoardingImage5)
                Image.network(movieEntity?.mediumCoverImage??'')
            ),

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
                  Text('${movieEntity?.rating??0}',style: AppStyles.whiteNormal15.copyWith(
                    fontSize: 20
                  ),),
                  SizedBox(width: 5,),
                  Icon(Icons.star_rate,color: AppColor.appYellowColor,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
