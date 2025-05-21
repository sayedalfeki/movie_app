import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds:3)).then((value) {
      Navigator.pushReplacementNamed(context,AppRoutes.onBoardingHomeRoute);
    },);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset(AppAssets.splashImage)),
              ],
            ),
          ),
          //Spacer(),
          Text('Route',style: AppStyles.whiteBold24.copyWith(
            color: AppColor.appYellowColor
          ),),
          Text('powered by sayed elfeki',style: AppStyles.whiteNormal15,)
        ],
      ),
    );
  }
}
