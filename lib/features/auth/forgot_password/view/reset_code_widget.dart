import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/app_routes.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_dialoge.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/core/app_validation.dart';
import 'package:movie_app/features/auth/custom_language_widget.dart';
import 'package:movie_app/features/auth/forgot_password/view/change_password_widget.dart';
import 'package:movie_app/features/auth/forgot_password/view_model/forget_password_state.dart';
import 'package:movie_app/features/auth/forgot_password/view_model/forget_password_view_model.dart';

import '../../../../core/api/api_manager.dart';
import '../data/forget_password_remote_data_source_impl.dart';
import '../data/forget_password_repository_imp.dart';
import '../domain/forget_password_use_case.dart';
class ResetCodeWidget extends StatelessWidget {

  final ForgetPassWordViewModel forgetPassWordViewModel=ForgetPassWordViewModel(
      ForgetPassWordUseCase(ForgetPassWordRepositoryImpl
        (ForgetPassWordRemoteDataSourceImp(ApiManager.instance)))
  );

  ResetCodeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: forgetPassWordViewModel,
      listener: (context, state) {
        if (state is ResetCodeLoadingState) {
          AppDialogue.viewDialogue(context, '');
        }
        if (state is ResetCodeSuccessState) {
          print(state.message);
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.message!,acceptText: 'continue',
          acceptAction: (){
             Navigator.pushReplacementNamed(context,AppRoutes.changePasswordRoute);
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
        if (state is ResetCodeErrorState) {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
              cancelText:'cancel',cancelAction: (){} );
        }
      },
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: forgetPassWordViewModel.resetCodeFormKey,
              child: Column(
               // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    cursorColor: AppColor.appWhiteColor,
                    validator: AppValidation.validateText,
                    controller: forgetPassWordViewModel.resetCodeController,
                    style: AppStyles.whiteNormal15,
                    decoration: InputDecoration(
                      hintText: 'enter sent code',
                      labelText: 'reset code',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(onPressed: () {
                    //Navigator.pop(context);
                    forgetPassWordViewModel.resetCode();
                  },
                      child: Text('reset code',style: AppStyles.blackRegular16,)),
                ],
              ),
            ),
          ),
      ),
      );

  }

}