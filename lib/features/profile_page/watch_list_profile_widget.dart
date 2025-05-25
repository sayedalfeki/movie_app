import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';

class WatchListProfileWidget extends StatelessWidget {
  const WatchListProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppAssets.splashImage),
          ),
        ],
      ),
    );
  }
}
