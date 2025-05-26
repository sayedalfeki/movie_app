import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_keys.dart';
import 'package:movie_app/core/cash_helper.dart';
import 'package:movie_app/features/onboarding_screen/view_model/onboarding_state.dart';
import '../model/onboarding_model.dart';
class OnBoardingViewModel extends Cubit<OnBoardingState>
{
  OnBoardingViewModel():super(OnBoardingInitialState());
  int pageIndex=0;
  var pageController=PageController();
  List<OnBoardingModel> pages=OnBoardingModel.fillOnBoardingPages();
  move(int index,bool isNext)
  {
    if(isNext)
    {
      if(index==pages.length-1)
      {
        CashHelper.getInstance().saveBool(AppKeys.onBoardingKey,true);
        emit(OnBoardingNavigationState());
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
   emit(ChangeControllerState());
  }
}