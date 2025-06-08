import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_styles.dart';

class ScreenShotsWidget extends StatelessWidget {
  const ScreenShotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('screen shots',style: AppStyles.whiteNormal15,),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
            return Container(
              height:150,
              margin: EdgeInsets.all(8),
              child: Image.asset(
                fit: BoxFit.fitWidth,
                AppAssets.onBoardingImage3
              ),
            );
          },),
        )
      ],
    );
  }
}
