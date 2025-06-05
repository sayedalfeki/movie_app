import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/login/domain/login_request_entity.dart';
import 'package:movie_app/features/auth/login/domain/login_use_case.dart';
import 'package:movie_app/features/auth/login/view_model/login_state.dart';
class LoginViewModel extends Cubit<LoginState>
{
  LoginViewModel(this.loginUseCase):super(LoginInitialState());
  LoginUseCase loginUseCase;
  TextEditingController emailController=TextEditingController(text: 'sayed@gmail.com');
  TextEditingController passwordController=TextEditingController(text: '123456');
  var loginKey=GlobalKey<FormState>();
  bool isPasswordShowed=false;
  changeIsPasswordShowed()
  {
    isPasswordShowed=!isPasswordShowed;
    emit(ShowingPasswordState());
  }
  login()async
  {
    if(loginKey.currentState!.validate())
    {
      emit(LoginLoadingState());
      LoginRequest request=LoginRequest(emailController.text, passwordController.text);
      var response=await loginUseCase.invoke(request);
      if(response.response!=null)
      {

        emit(LoginSuccessState());
      }
      else
      {
        emit(LoginErrorState(response.error));
      }
    }
  }

}