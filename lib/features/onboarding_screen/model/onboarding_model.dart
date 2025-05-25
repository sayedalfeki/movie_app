import 'package:movie_app/core/app_assets.dart';

class OnBoardingModel
{
  final String image;
  final String title;
  final String description;

  OnBoardingModel({required this.image, required this.title, required this.description});
fillOnBoardingPages()
{
  List<OnBoardingModel> pages=[
    OnBoardingModel(image:AppAssets.onBoardingImage1, title:'discover movies',
        description: 'explore a vast collection of movies'
            'explore a vast collection of movies explore a vast collection of movies'
            'explore a vast collection of movies explore a vast collection of movies '),
    OnBoardingModel(image:AppAssets.onBoardingImage2, title:'', description:''),
    OnBoardingModel(image: image, title: title, description: description),
    OnBoardingModel(image: image, title: title, description: description),
    OnBoardingModel(image: image, title: title, description: description),
  ];
}
}