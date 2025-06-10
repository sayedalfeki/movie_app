import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: AppColor.appYellowColor,
    ),);
  }
}
