import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/onboarding_screen/model/onboarding_model.dart';
class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.visible,
    required this.next, required this.onBoardingModel,
    required this.onNextPressed, this.onBackPressed,});
  final OnBoardingModel onBoardingModel;
  final bool visible;
  final String next;
  final void Function() onNextPressed;
  final void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(onBoardingModel.image))
      ),
child: Column(
  children: [
    Spacer(),
    choiceWidget(context: context,onBoardingModel: onBoardingModel,
        visible: visible,
        next: next,onNextPressed: onNextPressed,onBackPressed: onBackPressed),
  ],
),
    );
  }
 Widget choiceWidget({required BuildContext context,
   required OnBoardingModel onBoardingModel,
   required bool visible,required String next,
   required void Function() onNextPressed,void Function()? onBackPressed})
  {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:AppColor.mainAppColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text(onBoardingModel.title,style: AppStyles.whiteBold24,)),
          SizedBox(height: 5,),
          Visibility(
            visible:onBoardingModel.description.isEmpty?false:true,
            child: Container(
              //width:50,
              //color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal:50),
              child: Text(onBoardingModel.description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppStyles.whiteNormal15,),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed:onNextPressed,
              child:Text(next,style: AppStyles.blackRegular16,
              )),
          Visibility(
            visible:visible ,
            child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStatePropertyAll(AppColor.mainAppColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppColor.appYellowColor)
                  ))
                ),
                onPressed:onBackPressed, child:Text('back',style: AppStyles.yellowRoboto14,)),
          ),
        ],
      ),
    );
  }
}