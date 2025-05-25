import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/features/auth/forgot_password/forgot_password_page.dart';
import 'package:movie_app/features/auth/login/login_page.dart';
import 'package:movie_app/features/auth/register/register_page.dart';
import 'package:movie_app/features/home/home_page.dart';
import 'package:movie_app/features/movie_details_page/movie_details_page.dart';
import 'package:movie_app/features/onboarding_screen/view/onboarding_home_page.dart';
import 'package:movie_app/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:movie_app/features/profile_page/edit_profile_page.dart';
import 'package:movie_app/features/splash_screen.dart';
import '../config/app_theme.dart';
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
        initialRoute: AppRoutes.splashRoute,
        routes: {
          AppRoutes.splashRoute:(_)=>SplashScreen(),
          AppRoutes.onBoardingRoute:(_)=>OnboardingScreen(),
          AppRoutes.onBoardingHomeRoute:(_)=>OnboardingHomePage(),
          AppRoutes.loginRoute:(_)=>LoginPage(),
          AppRoutes.registerRoute:(_)=>RegisterPage(),
          AppRoutes.forgotPasswordRoute:(_)=>ForgotPasswordPage(),
          AppRoutes.homeRoute:(_)=>HomePage(),
          AppRoutes.editProfileRoute:(_)=>EditProfilePage(),
          AppRoutes.movieDetailsRoute:(_)=>MovieDetailsPage()
        },
      ),
    );
  }
}