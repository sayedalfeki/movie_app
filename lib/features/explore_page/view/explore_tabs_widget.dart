import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';

class ExploreTabsWidget extends StatelessWidget {
  const ExploreTabsWidget({super.key,required this.isSelected,required this.text});
final bool isSelected;
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected?AppColor.appYellowColor:Colors.transparent,
        border: Border.all(color: isSelected?Colors.transparent:AppColor.appYellowColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text,style: isSelected?AppStyles.blackNormal20:AppStyles.yellowRoboto14,),
    );
  }
}
