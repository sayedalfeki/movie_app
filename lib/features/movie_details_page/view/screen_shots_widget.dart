import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_styles.dart';

class ScreenShotsWidget extends StatelessWidget {
  const ScreenShotsWidget({super.key,required this.images});
final List images;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('screen shots',style: AppStyles.whiteNormal15,),
        Expanded(
          child: ListView.builder(
            itemCount:images.length,
            itemBuilder: (context, index) {
            return Container(
              height:150,
              margin: EdgeInsets.all(8),
              child:
              Image.network(
                images[index],
                fit: BoxFit.fitWidth,

              ),
            );
          },),
        )
      ],
    );
  }
}
