import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/features/onboarding_screen/model/onboarding_model.dart';
import 'package:movie_app/features/onboarding_screen/view/onboarding_widget.dart';
class OnboardingHomePage extends StatelessWidget {
  const OnboardingHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        onBoardingModel: OnBoardingModel(image:AppAssets.moviePosterImage,
            title:'Find Your Next Favorite Movie Here',
            description:'Get access to a huge library of movies to suit all tastes. You will surely like it.'),
          visible:false,
          next: 'Explore Now',
        onNextPressed: () {
        Navigator.pushNamed(context,AppRoutes.onBoardingRoute);
      },
      ),
    );
  }
}
