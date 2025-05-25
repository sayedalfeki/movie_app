import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_styles.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
      children: [
        Column(
         children: [
           Image.asset(
               width:100,
               height:100,
               AppAssets.avatar1),
         SizedBox(height: 10,),
         Text('sayed elfeki',style: AppStyles.whiteBold24.copyWith(
           fontSize: 20
         ),)
         ]
        ),
        Column(
          children: [
            Text('12',style: AppStyles.whiteBold24,),
            SizedBox(height: 10,),
            Text('wish list',style: AppStyles.whiteBold24,)
          ],
        ),
        Column(
          children: [
            Text('12',style: AppStyles.whiteBold24,),
            SizedBox(height: 10,),
            Text('wish list',style: AppStyles.whiteBold24,)
          ],
        )
      ],
    );
  }
}
