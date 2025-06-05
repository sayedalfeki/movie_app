import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/splash/view_model/splash_state.dart';
import 'package:movie_app/features/splash/view_model/splash_view_model.dart';
class SplashScreen extends StatelessWidget {
  final SplashViewModel splashViewModel = SplashViewModel();
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashViewModel, SplashState>(
      bloc: splashViewModel..navigate(),
      listener: (context, state) {
        if (state is SplashNavigationState) {
          Navigator.pushReplacementNamed(
            context,
            state.isBoardingViewed == null
                ? AppRoutes.onBoardingHomeRoute
                : AppRoutes.loginRoute,
          );
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: Image.asset(AppAssets.splashImage))],
              ),
            ),
            Text(
              'Route',
              style: AppStyles.whiteBold24.copyWith(
                color: AppColor.appYellowColor,
              ),
            ),
            Text('powered by sayed elfeki', style: AppStyles.whiteNormal15),
          ],
        ),
      ),
    );
  }
}
