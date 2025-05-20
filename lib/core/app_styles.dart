

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';

class AppStyles
{
  static  TextStyle whiteNormal15=TextStyle(
    fontSize: 15.sp,
    color: AppColor.appWhiteColor,
    fontWeight: FontWeight.normal
  );
  static  TextStyle whiteBold24=TextStyle(
      fontSize: 24.sp,
      color: AppColor.appWhiteColor,
      fontWeight: FontWeight.bold
  );
  static  TextStyle blackRegular16=TextStyle(
      fontSize: 16.sp,
      color: AppColor.mainAppColor,
      fontWeight: FontWeight.w400
  );
  static  TextStyle blackNormal20=TextStyle(
      fontSize:20.sp,
      color: AppColor.mainAppColor,
      fontWeight: FontWeight.normal
  );
  static  TextStyle yellowRoboto14=TextStyle(
      fontSize: 14.sp,
      color: AppColor.appYellowColor,
      fontWeight: FontWeight.w500
  );
}