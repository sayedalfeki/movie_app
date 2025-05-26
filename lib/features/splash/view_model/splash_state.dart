class SplashState{}
class SplashInitialState extends SplashState{}
class SplashNavigationState extends SplashState{
  bool? isBoardingViewed;
  SplashNavigationState(this.isBoardingViewed);
}