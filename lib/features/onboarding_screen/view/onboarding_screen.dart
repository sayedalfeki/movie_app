import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/features/onboarding_screen/model/onboarding_model.dart';
import 'package:movie_app/features/onboarding_screen/view/onboarding_widget.dart';
import 'package:movie_app/features/onboarding_screen/view_model/onboarding_state.dart';
import 'package:movie_app/features/onboarding_screen/view_model/onboarding_view_model.dart';
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
 final OnBoardingViewModel onBoardingViewModel=OnBoardingViewModel();
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingViewModel,OnBoardingState>(
      bloc: onBoardingViewModel,
      listener: (context, state) {
        if(state is OnBoardingNavigationState)
        {
          Navigator.pushNamed(context,AppRoutes.loginRoute);
        }
      },
      builder:(context, state) =>  Scaffold(
        body: PageView.builder(
          controller:onBoardingViewModel.pageController,
            itemCount:onBoardingViewModel.pages.length,
            itemBuilder:(context, index) => OnboardingWidget(
              onNextPressed: () {
                onBoardingViewModel.move(index,true);
              },
              onBackPressed: () {
                onBoardingViewModel.move(index,false);
              },
             onBoardingModel:onBoardingViewModel.pages[index],
            visible: index>0,
              next: index==onBoardingViewModel.pages.length-1?'finish':'next',
            ))
      ),
    );
  }

}
