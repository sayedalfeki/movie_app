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
import 'package:movie_app/features/auth/forgot_password/data/forget_password_remote_data_source_impl.dart';
import 'package:movie_app/features/auth/forgot_password/data/forget_password_repository_imp.dart';
import 'package:movie_app/features/auth/forgot_password/domain/forget_password_use_case.dart';
import 'package:movie_app/features/auth/forgot_password/view/reset_code_widget.dart';
import 'package:movie_app/features/auth/forgot_password/view_model/forget_password_state.dart';
import 'package:movie_app/features/auth/forgot_password/view_model/forget_password_view_model.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final ForgetPassWordViewModel forgetPassWordViewModel =
      ForgetPassWordViewModel(
        ForgetPassWordUseCase(
          ForgetPassWordRepositoryImpl(
            ForgetPassWordRemoteDataSourceImp(ApiManager.instance),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: forgetPassWordViewModel,
      listener: (context, state) {
        if (state is ForgetPassWordLoadingState) {
          AppDialogue.viewDialogue(context, '');
        }
        if (state is ForgetPassWordSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context,AppRoutes.resetCodeRoute);

          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       contentPadding: EdgeInsets.zero,
          //       content: ResetCodeWidget(),
          //     );
          //   },
          // );
          //AppDialogue.viewDialogue(context,'');
        }
        if (state is ForgetPassWordErrorState) {
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,state.errorMessage!,
              cancelText:'cancel',cancelAction: (){} );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: Theme.of(
            context,
          ).iconTheme.copyWith(color: AppColor.appYellowColor),
          backgroundColor: Colors.transparent,
          title: Text('forgot password', style: AppStyles.yellowRoboto14),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: forgetPassWordViewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.forgetPassword),
                SizedBox(height: 15),
                TextFormField(
                  cursorColor: AppColor.appWhiteColor,
                  validator: AppValidation.validateEmail,
                  controller: forgetPassWordViewModel.emailController,
                  style: AppStyles.whiteNormal15,
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    forgetPassWordViewModel.verifyEmail();
                    },
                  child: Text('verify email', style: AppStyles.blackRegular16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
