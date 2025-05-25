import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/app_styles.dart';

import '../search/search_item_widget.dart';

class SimilarMovieWidget extends StatelessWidget {
  const SimilarMovieWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('similar',style: AppStyles.whiteNormal15,),
          SizedBox(height: 10,),
      Expanded(child: GridView.builder(
        itemCount: 6,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
          (crossAxisCount:2,
            childAspectRatio: 2/3
        ),
        itemBuilder:(context, index) {
          return SearchItemWidget();
        },))
        ],
      ),
    );
  }
}
