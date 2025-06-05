import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/features/explore_page/explore_page.dart';
import 'package:movie_app/features/home/view_model/home_state.dart';
import 'package:movie_app/features/home/view_model/home_view_model.dart';
import 'package:movie_app/features/movies_page/movies_page.dart';
import 'package:movie_app/features/profile_page/profile_page.dart';
import 'package:movie_app/features/search/search_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel=HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModel,HomeState>(
      bloc: homeViewModel,
      listener: (context, state) {

      },
      builder:(context, state) =>  SafeArea(
        child: Scaffold(
          body: homeViewModel.pages[homeViewModel.currentIndex],
          bottomNavigationBar: Theme(data:Theme.of(context).copyWith(
            canvasColor: AppColor.appLightBlackColor
          ) ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BottomNavigationBar(
                    onTap: homeViewModel.changeCurrentIndex,
                    currentIndex:homeViewModel.currentIndex,
                    type: BottomNavigationBarType.fixed,
                      selectedItemColor: AppColor.appYellowColor,
                      unselectedItemColor: AppColor.appWhiteColor,
                      items: [
                        BottomNavigationBarItem(icon:Icon(Icons.home,),label: '' ),
                        BottomNavigationBarItem(icon:Icon(Icons.search),label: '' ),
                        BottomNavigationBarItem(icon:Icon(Icons.explore) ,label: ''),
                        BottomNavigationBarItem(icon:Icon(Icons.person_rounded),label: '' ),
                      ]),
                ),
              )),
        ),
      ),
    );
  }
}
