import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/search/search_item_widget.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key});
List<String> movies=['s'];
  @override
  Widget build(BuildContext context) {
    movies.add('s');
    return Padding(

      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            style: AppStyles.whiteNormal15,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'search'
            ),
          ),
         Expanded(
            child:movies.isEmpty? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(AppAssets.splashImage),
                ),
              ],
            ):GridView.builder(
              itemCount: 10,
              itemBuilder: (context,index) {
                return SearchItemWidget();
              },
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount: 2,
              childAspectRatio: 2/3,
                //crossAxisSpacing: 5,
                mainAxisSpacing: 5
              ),
            ),
          )
        ],
      ),
    );
  }
}
