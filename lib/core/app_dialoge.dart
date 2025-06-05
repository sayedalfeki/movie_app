
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';

class AppDialogue
{

  static viewDialogue(BuildContext context,String message,{String? acceptText,String? cancelText
 , Function? acceptAction,Function? cancelAction
  })
  {
    showDialog(
      useSafeArea: true,
      barrierDismissible: cancelAction==null&&acceptAction==null,
      context: context, builder: (context) {
      return AlertDialog(
        elevation: 30,
        backgroundColor: AppColor.appLightBlackColor,
        contentPadding: EdgeInsets.zero,
        content: message.isEmpty?Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: AppColor.appYellowColor,
                    color: AppColor.appLightBlackColor,
                  ),
                  SizedBox(height: 10,),
                  Text('loading ...............',style: AppStyles.whiteBold24,)
                ],
              ),
        ):
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(message,textAlign: TextAlign.center,style: AppStyles.whiteNormal15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: acceptText!=null,
                          child: TextButton(onPressed:() {
                            Navigator.pop(context);
                            if(acceptAction!=null) {
                              acceptAction();
                            }

                          },child: Text(acceptText??'',style: AppStyles.yellowRoboto14.copyWith(
                            fontSize: 20
                          ),)),
                        ),
                        SizedBox(width: 15,),
                        Visibility(
                          visible: cancelText!=null,
                          child: TextButton(onPressed:() {
                            Navigator.pop(context);
                            if(cancelAction!=null) {
                              cancelAction();
                            }
                          },child: Text(cancelText??'',style: AppStyles.yellowRoboto14.copyWith(
                            fontSize: 20
                          ),)),
                        )
                      ],
                    )
                  ],
                ),
          ),
        ),


      );
    },);
  }
}