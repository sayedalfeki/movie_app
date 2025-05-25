import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/features/search/search_item_widget.dart';

import '../../core/app_styles.dart';

class AvailableNowWidget extends StatelessWidget {
   AvailableNowWidget({super.key});
  List<String> images=[AppAssets.onBoardingImage1,AppAssets.onBoardingImage2,
    AppAssets.onBoardingImage3];
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppAssets.onBoardingImage1))
      ),
      child: Column(
        children: [
          Text('Available Now',style:GoogleFonts.abhayaLibre(
            color: AppColor.appWhiteColor,
            fontSize: 35
          ),),
          SizedBox(height: 20,),
         CarouselSlider.builder(
             itemCount:images.length,
             itemBuilder:(context, index, realIndex) {
               return GestureDetector(
                   onTap: () {
                     Navigator.pushNamed(context,AppRoutes.movieDetailsRoute);
                   },
                   child: SearchItemWidget());
             },
             options:CarouselOptions(
               initialPage:selectedIndex ,
             height: 400,
               enlargeCenterPage: true,
               viewportFraction: .6
             )),
          Text('Watch Now',style:GoogleFonts.abhayaLibre(
              color: AppColor.appWhiteColor,
              fontSize: 35
          ),),

        ],
      ),
    );
  }
}
