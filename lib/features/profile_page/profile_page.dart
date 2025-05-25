import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/profile_page/history_profile_widget.dart';
import 'package:movie_app/features/profile_page/profile_tabs_widget.dart';
import 'package:movie_app/features/profile_page/profile_widget.dart';
import 'package:movie_app/features/profile_page/watch_list_profile_widget.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
List<Widget> pages=[WatchListProfileWidget(),HistoryProfileWidget()];

int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
         ProfileWidget(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context,AppRoutes.editProfileRoute);
                },
                    child:Text('Edit Profile',style: AppStyles.blackRegular16,)),
              ),
              SizedBox(width:10,),

              ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStatePropertyAll(AppColor.appRedColor)
                  ),
                  onPressed: () {},
                  child:Row(
                    children: [
                      Text('Exit',style: AppStyles.whiteNormal15,),
                      SizedBox(width: 5,),
                      Icon(Icons.output,color: AppColor.appWhiteColor,)
                    ],
                  )),
            ],
          ),
          SizedBox(height: 10,),
          DefaultTabController(
              length: 2,
              initialIndex: selectedIndex,
              child:TabBar(
                onTap: (value) {
                  selectedIndex=value;
                  setState(() {

                  });
                },
                indicatorSize:TabBarIndicatorSize.tab ,
                automaticIndicatorColorAdjustment: false,
                  indicatorColor: AppColor.appYellowColor,
                  dividerColor: Colors.transparent,
                  //isScrollable: true,
                  //tabAlignment: TabAlignment.start,
                  tabs: [
                ProfileTabsWidget(icon: Icons.list_rounded, data: 'watch list'),
                ProfileTabsWidget(icon: Icons.folder, data: 'history'),

              ]) ),
          pages[selectedIndex]

        ],
      ),
    );
  }
}
