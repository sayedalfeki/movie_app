import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Container(
              height: 200,
              child: Image.asset(
                  AppAssets.splashImage),
            ),
            Spacer(),
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
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,AppRoutes.forgotPasswordRoute);
                    },
                    child: Text('forget password ?',style: AppStyles.yellowRoboto14,))
              ],
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homeRoute);

            },
                child: Text('login',style: AppStyles.blackRegular16,)),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dont have account?',style: AppStyles.whiteNormal15,),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.registerRoute);
                  },child: Text('create one',style: AppStyles.yellowRoboto14,))
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 100,
                  color: AppColor.appYellowColor,
                ),
                Text(' or ',style: AppStyles.yellowRoboto14,),
                Container(
                  height: 1,
                  width: 100,
                  color: AppColor.appYellowColor,
                )
              ],
            ),
          SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('G',style: AppStyles.blackNormal20.copyWith(
                  fontSize:35,
                  color: AppColor.appLightBlackColor
                ),),
                SizedBox(width: 5,),
                Text('login with google',
                  style:AppStyles.blackRegular16 ,),
              ],
            )),
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
