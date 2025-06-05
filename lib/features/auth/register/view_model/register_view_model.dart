import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/register/domain/register_use_case.dart';
import 'package:movie_app/features/auth/register/request_entity/register_request_entity.dart';
import 'package:movie_app/features/auth/register/view_model/register_state.dart';

class RegisterViewModel extends Cubit<RegisterState>
{
  RegisterViewModel(this.registerUseCase):super(RegisterInitialState());
  late RegisterUseCase registerUseCase;
  TextEditingController userNameController=TextEditingController(text: 'sayed');
  TextEditingController emailController=TextEditingController(text: 'sayed@gmail.com');
  TextEditingController passWordController=TextEditingController(text: '123456');
  TextEditingController confirmPassWordController=TextEditingController(text: '123456');
  TextEditingController phoneController=TextEditingController(text: '0112345678');
  var formKey=GlobalKey<FormState>();
  bool isPasswordShowed=false;
  changeIsPasswordShowed()
  {
    isPasswordShowed=!isPasswordShowed;
    emit(ShowingPasswordState());
  }
  register()async
  {
    if(formKey.currentState!.validate())
    {
      emit(RegisterLoadingState());
      RegisterRequestEntity registerRequestEntity=RegisterRequestEntity(
        name: userNameController.text,
        email: emailController.text,
        password: passWordController.text,
        rePassword: confirmPassWordController.text,
        phone: phoneController.text
      );
      var response=await registerUseCase.invoke(registerRequestEntity);
      if(response.response!=null)
      {
       // print(response.response?.statusMsg);
        emit(RegisterSuccessState(response.response));
      }
      else
      {
        emit(RegisterErrorState(response.error));
      }
      //emit(RegisterNavigationState());
    }
  }
}