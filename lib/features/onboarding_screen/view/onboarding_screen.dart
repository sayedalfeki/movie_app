import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/features/onboarding_screen/view/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
final List<String> onBoardingImages=[AppAssets.moviePosterImage,
  AppAssets.onBoardingImage1,AppAssets.onBoardingImage2,AppAssets.onBoardingImage3
  ,AppAssets.onBoardingImage4,AppAssets.onBoardingImage5
];
int pageIndex=0;
var pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
          itemCount: onBoardingImages.length,
          itemBuilder:(context, index) => OnboardingWidget(
            onNextPressed: () {
              move(index,true);
            },
            onBackPressed: () {
              move(index,false);
            },
            image: onBoardingImages[index],
            title: 'discover movies',
            description: 'explore a vast collection of movies'
                'explore a vast collection of movies explore a vast collection of movies'
                'explore a vast collection of movies explore a vast collection of movies ',
          visible: index>0,
            next: index==onBoardingImages.length-1?'finish':'next',
          ))
    );
  }
  move(int index,bool isNext)
  {
    if(isNext)
    {
      if(index==onBoardingImages.length-1)
      {
        Navigator.pushNamed(context,AppRoutes.loginRoute);
      }
      else
      {
        pageIndex=index+1;
      }
    }
    else
    {
      pageIndex=index-1;
    }
    pageController.jumpToPage(pageIndex);
    setState(() {

    });
  }
}
