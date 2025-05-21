import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/features/onboarding_screen/onboarding_widget.dart';

class OnboardingHomePage extends StatelessWidget {
  const OnboardingHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(title:'find your next movies here',
          description: 'get access to a huge library of movies',
          visible:false,
          next: 'explore',
          image:AppAssets.moviePosterImage,
      onNextPressed: () {
        Navigator.pushNamed(context,AppRoutes.onBoardingRoute);
      },
      ),
    );
  }
}
