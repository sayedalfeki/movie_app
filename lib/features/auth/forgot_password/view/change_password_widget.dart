import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_dialoge.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/core/app_validation.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';
import 'package:movie_app/features/auth/forgot_password/view_model/forget_password_state.dart';
import 'package:movie_app/features/auth/forgot_password/view_model/forget_password_view_model.dart';

import '../../../../core/api/api_manager.dart';
import '../data/forget_password_remote_data_source_impl.dart';
import '../data/forget_password_repository_imp.dart';
import '../domain/forget_password_use_case.dart';

class ChangePasswordWidget extends StatelessWidget {
  final ForgetPassWordViewModel forgetPassWordViewModel=ForgetPassWordViewModel(
      ForgetPassWordUseCase(ForgetPassWordRepositoryImpl
        (ForgetPassWordRemoteDataSourceImp(ApiManager.instance)))
  );
  ChangePasswordWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassWordViewModel,ForgetPassWordState>(
      bloc: forgetPassWordViewModel,
      listener: (context, state) {
        if (state is ChangePasswordLoadingState) {
          AppDialogue.viewDialogue(context, '');
        }
        if (state is ChangePasswordSuccessState) {

          Navigator.pop(context);
          AppDialogue.viewDialogue(context,'password changes please login ',acceptText: 'continue',
              acceptAction: (){
                Navigator.pushReplacementNamed(context,AppRoutes.loginRoute);
              });
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       contentPadding: EdgeInsets.zero,
          //       content: ChangePasswordWidget(),
          //     );
          //   },
          // );
          //AppDialogue.viewDialogue(context,'');
        }
        if (state is ChangePasswordErrorState) {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
              cancelText:'cancel',cancelAction: (){} );
        }
      },
      builder:(context, state) =>  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: forgetPassWordViewModel.changePasswordFormKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    cursorColor: AppColor.appWhiteColor,
                    validator: AppValidation.validateEmail,
                    controller: forgetPassWordViewModel.emailController,
                    style: AppStyles.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'email',
                      labelStyle: AppStyles.yellowRoboto14,
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    cursorColor: AppColor.appWhiteColor,
                    validator: AppValidation.validatePassword,
                    controller: forgetPassWordViewModel.newPasswordController,
                    style: AppStyles.whiteNormal15,
                    decoration: InputDecoration(
                      labelStyle: AppStyles.yellowRoboto14,
                      hintText: 'enter new password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          forgetPassWordViewModel.changeIsPasswordHidden();
                        },
                        icon: Icon(forgetPassWordViewModel.isPassWordHidden?
                        Icons.visibility_off:Icons.visibility),
                      ),

                    ),
                    obscureText: forgetPassWordViewModel.isPassWordHidden,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      forgetPassWordViewModel.changePassword();
                    },
                    child: Text('change password', style: AppStyles.blackRegular16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
