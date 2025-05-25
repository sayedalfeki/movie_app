import 'package:flutter/material.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(
            color:AppColor.appYellowColor
        ),
        backgroundColor: Colors.transparent,
        title: Text('forgot password',style: AppStyles.yellowRoboto14,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
                AppAssets.forgetPassword),
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
            ElevatedButton(onPressed: () {},
                child: Text('verify email',style: AppStyles.blackRegular16,)),
          ],
        ),
      ),
    );
  }
}