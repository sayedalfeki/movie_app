
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/view_model/home_state.dart';
import 'package:movie_app/features/movies_page/view/available_now_widget.dart';

import '../../explore_page/explore_page.dart';

import '../../profile_page/profile_page.dart';
import '../../search/view/search_page.dart';

class HomeViewModel extends Cubit<HomeState>
{
  HomeViewModel():super(InitHomeState());
  int currentIndex=0;
  List<Widget> pages=[AvailableNowWidget(),SearchPage(),ExplorePage(),ProfilePage()];
  changeCurrentIndex(int value)
  {
    currentIndex=value;
    emit(ChangeCurrentIndexState());
  }
}