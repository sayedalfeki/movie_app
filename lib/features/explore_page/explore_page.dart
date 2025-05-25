import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/explore_page/explore_tabs_widget.dart';
import 'package:movie_app/features/search/search_item_widget.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> movies=['action','adventure','animation','comedy','documentary'];

  int selectedTabIndex=0;

  @override
  Widget build(BuildContext context) {
   // movies.add('s');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
         DefaultTabController(
           length: movies.length,
           initialIndex: selectedTabIndex,
           child: TabBar(
             //physics: AlwaysScrollableScrollPhysics(),
             onTap: (value) {
               selectedTabIndex=value;
               setState(() {

               });
             },
             isScrollable: true,
               tabAlignment: TabAlignment.start,
               labelPadding: EdgeInsets.zero,
               dividerColor: Colors.transparent,
               indicatorColor: Colors.transparent,
               tabs:movies.map((e) {
             return ExploreTabsWidget(isSelected:
                 movies.indexOf(e)==selectedTabIndex,
                  text:e);
           },).toList()),
         ),
          SizedBox(height: 10,),
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
