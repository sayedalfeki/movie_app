import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('cast',style: AppStyles.whiteNormal15,),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
              return CastCard();
            },),
          )
        ],
      ) ,
    );
  }
  Widget CastCard()
  {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.appLightBlackColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: ClipRRect(
              child: Image.asset(AppAssets.avatar1),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('name: hgkjlk;kl;jhj',style: AppStyles.whiteNormal15,),
              SizedBox(height: 10,),
              Text('character: hgggfdgfewwytkjgkjhjnmmvn',style: AppStyles.whiteNormal15,)
            ],
          )
        ],
      ),
    );
  }
}
