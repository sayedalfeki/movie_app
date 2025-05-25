import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color:AppColor.appYellowColor
        ),
        backgroundColor: Colors.transparent,
        title: Text('register',style: AppStyles.yellowRoboto14,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Image.asset(AppAssets.avatar3),

               Image.asset(AppAssets.avatar1),
               Image.asset(AppAssets.avatar2),
             ],
           ),
            Spacer(),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                hintText: 'name',
                labelText: 'name',
                prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                hintText: 'email',
                labelText: 'email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                  hintText: 'password',
                  labelText: 'password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon : Icon(Icons.remove_red_eye_rounded)
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                hintText: 'confirm password',
                labelText: 'confirm password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_rounded)
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              style: AppStyles.whiteNormal15,
              decoration: InputDecoration(
                hintText: 'phone',
                labelText: 'phone',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {},
                child: Text('create account',style: AppStyles.blackRegular16,)),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('already have an account??',style: AppStyles.whiteNormal15,),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                },child: Text('login',style: AppStyles.yellowRoboto14,))
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Spacer(),
                CustomLanguageWidget(),
                Spacer()
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}