import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_dialoge.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/core/app_validation.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';
import 'package:movie_app/features/auth/login/data/login_repository_impl.dart';
import 'package:movie_app/features/auth/login/data/remot_data_source/login_remot_data_source_dio_imp.dart';
import 'package:movie_app/features/auth/login/domain/login_use_case.dart';
import 'package:movie_app/features/auth/login/view_model/login_state.dart';
import 'package:movie_app/features/auth/login/view_model/login_view_model.dart';
class LoginPage extends StatelessWidget {
   LoginPage({super.key});
 final LoginViewModel loginViewModel=LoginViewModel(
   LoginUseCase(
     LoginRepositoryImpl(LoginRemoteDataSourceDioImp(ApiManager.instance))
   )
 );
  @override
  Widget build(BuildContext context) {
    double height=16.h;
    print(height);
    return BlocConsumer<LoginViewModel,LoginState>(
      bloc: loginViewModel,
      listener: (BuildContext context, LoginState state) {
        if(state is LoginLoadingState)
        {
          AppDialogue.viewDialogue(context,'');
        }
        if(state is LoginSuccessState)
        {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,'login successfully',
          acceptText: 'continue',
          acceptAction:(){
            Navigator.pushNamed(context, AppRoutes.homeRoute);
          }
          );
        }
        if(state is LoginErrorState)
        {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
          cancelText: 'cancel',
            cancelAction: (){

            }
          );
        }
      },
      builder:(context, state) =>  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.all(height),
            child: Form(
              key: loginViewModel.loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height:50.h,),
                  Container(
                   // color: AppColor.appRedColor,
                    height: 100.h,
                    child: Image.asset(
                        AppAssets.splashImage,
                    fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height:100.h,),
                  TextFormField(
                    validator: AppValidation.validateEmail,
                    controller: loginViewModel.emailController,
                    style: AppStyles.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  TextFormField(
                    validator: AppValidation.validatePassword,
                  controller: loginViewModel.passwordController,
                    style: AppStyles.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                     suffixIcon : IconButton(
                         onPressed: ()
                         {
                           loginViewModel.changeIsPasswordShowed();
                           },
                         icon:Icon(loginViewModel.isPasswordShowed?
                         Icons.visibility:Icons.visibility_off)),

                    ),
                    obscureText: !loginViewModel.isPasswordShowed,
                  ),
                  SizedBox(height: 10.h,),
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
                  SizedBox(height: 15.h,),
                  ElevatedButton(onPressed: () {
              loginViewModel.login();
                  },
                      child: Text('login',style: AppStyles.blackRegular16,)),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('dont have account?',style: AppStyles.whiteNormal15,),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registerRoute);
                        },child: Text('create one',style: AppStyles.yellowRoboto14,))
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.h,
                        width: 100.w,
                        color: AppColor.appYellowColor,
                      ),
                      Text(' or ',style: AppStyles.yellowRoboto14,),
                      Container(
                        height: 1.h,
                        width: 100.w,
                        color: AppColor.appYellowColor,
                      )
                    ],
                  ),
                SizedBox(height: 20.h,),
                  ElevatedButton(onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('G',style: AppStyles.blackNormal20.copyWith(
                        fontSize:35,
                        color: AppColor.appLightBlackColor
                      ),),
                      SizedBox(width: 5.w,),
                      Text('login with google',
                        style:AppStyles.blackRegular16 ,),
                    ],
                  )),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      Spacer(),
                      CustomLanguageWidget(),
                      Spacer()
                    ],
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
