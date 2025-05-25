import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(
            color:AppColor.appYellowColor
        ),
        backgroundColor: Colors.transparent,
        title: Text('pick avatar',style: AppStyles.yellowRoboto14,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
                onTap: () {
                  showAvatarModalSheet(context);
                },
                child: Center(child: Image.asset(AppAssets.avatar1))),
            SizedBox(height: 15,),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                hintText: 'sayed elfeki',
                labelText: 'name',
                prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
              ),
            ),
           SizedBox(height: 10,),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                hintText: '01234567890',
                labelText: 'phone',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 15,),
            Text('reset password',style: AppStyles.whiteNormal15,),
            Spacer(),
            ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStatePropertyAll(AppColor.appRedColor)
                ),
                onPressed: () {},
                child: Text('Delete Account',style: AppStyles.whiteNormal15,)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {},
                child: Text('update data',style: AppStyles.blackRegular16,)),

          ],
        ),
      ),
    );
  }
  Widget AvatarWidget(bool isSelected)
  {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border:Border.all(color: isSelected?Colors.transparent:AppColor.appYellowColor),
          borderRadius: BorderRadius.circular(8),
          color:isSelected?AppColor.appYellowColor: AppColor.appLightBlackColor
      ),
      child: Image.asset(AppAssets.avatar1),
    );
  }
  showAvatarModalSheet(BuildContext context)
  {
    showModalBottomSheet(context: context,
        builder: (context) {
          return Container(
            height: 410.h,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:AppColor.appLightBlackColor
            ),
            child: GridView.builder(
              itemCount: 9,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
                  (crossAxisCount:3),
                itemBuilder:(context, index) {
                  return AvatarWidget(index==1);
                },),
          );
        },
    backgroundColor:Colors.transparent,
      elevation: 10,
      //useSafeArea: true
    );
  }
}
