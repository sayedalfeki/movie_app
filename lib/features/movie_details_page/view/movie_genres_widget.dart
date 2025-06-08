import 'package:flutter/material.dart';
import 'package:movie_app/core/app_custom_widget/action_container_widget.dart';
import 'package:movie_app/core/app_styles.dart';

class MovieGenresWidget extends StatelessWidget {
  const MovieGenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('genres',style: AppStyles.whiteBold24,),
          Expanded(child: GridView.builder(
            itemCount:5,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount:3,
                childAspectRatio:2
            ),
            itemBuilder:(context, index) {
              return ActionContainerWidget(data: 'comedy',fontSize: 15,);
            },))
        ],
      ),
    );
  }
}
