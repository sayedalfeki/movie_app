import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_theme.dart';
import 'package:movie_app/core/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      builder:(context, child) =>  MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: Container(
          child: Text('starting ..............'),
        ),
      ),
    );
  }
}


