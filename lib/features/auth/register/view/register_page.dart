import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_dialoge.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/core/app_validation.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';
import 'package:movie_app/features/auth/register/data/register_remot_data_source/register_remot_dio_data_Source.dart';
import 'package:movie_app/features/auth/register/data/register_repository_impl.dart';
import 'package:movie_app/features/auth/register/domain/register_use_case.dart';
import 'package:movie_app/features/auth/register/view_model/register_state.dart';
import 'package:movie_app/features/auth/register/view_model/register_view_model.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
  final RegisterViewModel registerViewModel=RegisterViewModel(
    RegisterUseCase(
      registerRepository: RegisterRepositoryImpl
        (registerDataSource:RegisterRemoteDioDataSource(ApiManager.instance) )
    )
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterViewModel,RegisterState>(
      bloc: registerViewModel,
      listener:(context, state) {
             if(state is RegisterLoadingState)
             {
               //Navigator.pop(context);
               AppDialogue.viewDialogue(context,'');
             }
             if(state is RegisterSuccessState)
             {
               Navigator.pop(context);
               AppDialogue.viewDialogue(context,'registered successfully',
                   acceptText: 'continue',acceptAction: (){
                     Navigator.pushNamed(context,AppRoutes.homeRoute);
               });
             }
             if(state is RegisterErrorState)
             {
               Navigator.pop(context);
               AppDialogue.viewDialogue(context,state.errorMessage!,
               cancelText: 'cancel',
                 cancelAction: (){}
               );
             }
      } ,
      builder:(context, state) =>  Scaffold(
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
          child: Form(
            key: registerViewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Expanded(child: Image.asset(AppAssets.avatar3)),
                   Expanded(child: Image.asset(AppAssets.avatar1)),
                   Expanded(child: Image.asset(AppAssets.avatar2)),
                 ],
               ),
                Spacer(),
                TextFormField(
                  validator: AppValidation.validateText,
                  controller: registerViewModel.userNameController,
                  style: AppStyles.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'name',
                    labelText: 'name',
                    prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: AppValidation.validateEmail,
                  controller: registerViewModel.emailController,
                  style: AppStyles.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: AppValidation.validatePassword,
                  controller: registerViewModel.passWordController,
                  style: AppStyles.whiteNormal15,
                  obscureText: !registerViewModel.isPasswordShowed,
                  decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon : IconButton(
                          onPressed: () {
                            registerViewModel.changeIsPasswordShowed();
                          },
                          icon: Icon(registerViewModel.isPasswordShowed?
                          Icons.visibility:Icons.visibility_off))
                  ),

                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value) {
                    return AppValidation.validateConfirmPassword(value,
                        registerViewModel.passWordController.text);
                   },
                  controller: registerViewModel.confirmPassWordController,
                  style: AppStyles.whiteNormal15,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'confirm password',
                    labelText: 'confirm password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off)
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: AppValidation.validatePhone,
                  controller: registerViewModel.phoneController,
                  style: AppStyles.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'phone',
                    labelText: 'phone',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  registerViewModel.register();
                },
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
        ),
      ),
    );
  }
}