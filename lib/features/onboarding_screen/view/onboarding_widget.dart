import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.title,
    required this.description, required this.visible,
    required this.next, required this.image,
    required this.onNextPressed, this.onBackPressed,});
  final String image;
  final String title;
  final String description;
  final bool visible;
  final String next;
  final void Function() onNextPressed;
  final void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
     // alignment: Alignment.bottomCenter,
      // width: double.infinity,
      //height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image))
      ),
child: Column(
  children: [
    Spacer(),
    choiceWidget(context: context, title: title,
        description: description, visible: visible,
        next: next,onNextPressed: onNextPressed,onBackPressed: onBackPressed),
  ],
),
    );
  }
 Widget choiceWidget({required BuildContext context,
   required String title,required String description,
   required bool visible,required String next,
   required void Function() onNextPressed,void Function()? onBackPressed})
  {
    return Container(
      padding: EdgeInsets.all(8),
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
          Center(child: Text(title,style: AppStyles.whiteBold24,)),
          SizedBox(height: 5,),
          Text(description,
            style: AppStyles.whiteNormal15,),
          SizedBox(height: 10,),
          ElevatedButton(onPressed:onNextPressed,
              child:Text(next,style: AppStyles.blackRegular16,)),
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