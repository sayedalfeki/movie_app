import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';

class ProfileTabsWidget extends StatelessWidget {
  const ProfileTabsWidget({super.key, required this.icon, required this.data});
final IconData icon;
final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: AppColor.appYellowColor,),
        SizedBox(height: 10,),
        Text(data,style: AppStyles.whiteNormal15,)
      ],
    );
  }
}
