import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';

class AppTheme
{
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: AppColor.mainAppColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColor.appLightBlackColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.sp),
        borderSide: BorderSide(color: Colors.transparent)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.sp),
          borderSide: BorderSide(color: Colors.transparent)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.sp),
          borderSide: BorderSide(color: Colors.transparent)
      ),
      hintStyle:AppStyles.whiteNormal15,
      labelStyle:AppStyles.whiteNormal15,
      prefixIconColor: AppColor.appWhiteColor,
      suffixIconColor: AppColor.appWhiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        )),
        backgroundColor: WidgetStatePropertyAll(AppColor.appYellowColor),
        textStyle:WidgetStatePropertyAll(AppStyles.blackNormal20)
      )
    )
  );
}