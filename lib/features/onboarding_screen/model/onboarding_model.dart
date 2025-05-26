import 'package:movie_app/core/app_assets.dart';

class OnBoardingModel
{
  final String image;
  final String title;
  final String description;

  OnBoardingModel({required this.image, required this.title, required this.description});
static List<OnBoardingModel> fillOnBoardingPages()
{
  List<OnBoardingModel> pages=[
    OnBoardingModel(image:AppAssets.onBoardingImage1, title:'discover movies',
        description: 'explore a vast collection of movies'
            'explore a vast collection of movies explore a vast collection of movies'
            'explore a vast collection of movies explore a vast collection of movies '),
    OnBoardingModel(image:AppAssets.onBoardingImage2, title:'Explore All Genres',
        description:'Discover movies from every genre,in all available qualities.Find '
            'something new and exciting to watch every day.'),
    OnBoardingModel(image:AppAssets.onBoardingImage3, title:'Create Watch Lists',
        description:'Save movies to your watch list to keep track of what you want to watch next '
            'Enjoy films in various qualities and genres'),
    OnBoardingModel(image:AppAssets.onBoardingImage4, title:'Rate, Review and Learn ',
        description:"Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews"),
    OnBoardingModel(image:AppAssets.onBoardingImage5, title:'Start Watching Now', description:''),
  ];
  return pages;
}
}