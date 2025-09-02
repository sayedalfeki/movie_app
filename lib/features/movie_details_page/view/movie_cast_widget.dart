import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movie_details_page/domain/movie_details_entity.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({super.key,required this.casts});
final List<CastEntity> casts;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 300,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('cast',style: AppStyles.whiteNormal15,),
          SizedBox(height: 10,),
          casts.isEmpty?Text('no casts',style: AppStyles.whiteBold24,):Expanded(
            child: ListView.builder(
              itemCount:casts.length,
              itemBuilder: (context, index) {
              return CastCard(casts[index]);
            },),
          )
        ],
      ) ,
    );
  }
  Widget CastCard(CastEntity cast)
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
              borderRadius: BorderRadius.circular(50),
              child: Image.network(cast.urlSmallImage??'',
              fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('name: ${cast.name}',style: AppStyles.whiteNormal15,),
                SizedBox(height: 10,),
                Text('character: ${cast.characterName}',style: AppStyles.whiteNormal15,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
