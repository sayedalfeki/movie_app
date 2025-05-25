import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/features/search/search_item_widget.dart';

class HistoryProfileWidget extends StatelessWidget {
  const HistoryProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
          (crossAxisCount:3,
        childAspectRatio: 2/3
        ),
        itemBuilder:(context, index) {
          return SearchItemWidget();
        },));
  }
}
