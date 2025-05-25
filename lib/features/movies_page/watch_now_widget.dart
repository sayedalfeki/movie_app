import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/search/search_item_widget.dart';
class WatchNowWidget extends StatelessWidget {
  const WatchNowWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Action',style: AppStyles.whiteNormal15,),
            Row(children: [Text('see more',style: AppStyles.yellowRoboto14,),
              Icon(Icons.arrow_forward,color: AppColor.appYellowColor,)],)
          ],
        ),
        SizedBox(height: 15,),
        Expanded(
          child: Container(
            height:200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
              return SearchItemWidget();
            },),
          ),
        )
      ],
    );
  }
}
