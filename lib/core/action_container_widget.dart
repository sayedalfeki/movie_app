import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class ActionContainerWidget extends StatelessWidget {
  const ActionContainerWidget({super.key, required this.data,this.icon,
    this.fontSize=20});
  final String data;
  final IconData? icon;
 final double fontSize;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: AppColor.appLightBlackColor.withAlpha(230),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon==null?SizedBox(width: 0,):Icon(icon,color: AppColor.appYellowColor,),
          SizedBox(width: 5,),
          Text(data,style: AppStyles.whiteNormal15.copyWith(
              fontSize:fontSize
          ),),
        ],
      ),
    );
  }
}
