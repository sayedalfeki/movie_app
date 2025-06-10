import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/app_colors.dart';

class AppErrorWidget extends StatelessWidget {
   const AppErrorWidget({super.key,required this.errorMessage,this.onPressed});
  final String errorMessage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage,style:GoogleFonts.acme().copyWith(
          color: AppColor.appRedColor
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed:onPressed , child: Text('retry',style: GoogleFonts.aBeeZee().copyWith(
              color: AppColor.appYellowColor
            ),)),
          ],
        )
      ],
    ),);
  }
}
