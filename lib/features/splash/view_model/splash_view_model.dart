import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/splash/view_model/splash_state.dart';
import '../../../core/app_keys.dart';
import '../../../core/cash_helper.dart';
class SplashViewModel extends Cubit<SplashState>
{
  SplashViewModel():super(SplashInitialState());
void navigate()
{
  Future.delayed(Duration(seconds: 3)).then((value) async{
    CashHelper cashHelper=await CashHelper.getInstance();
    bool? isBoardingViewed=cashHelper.getSavedBool(AppKeys.onBoardingKey);
    emit(SplashNavigationState(
      isBoardingViewed
    ));
  },);
}
}