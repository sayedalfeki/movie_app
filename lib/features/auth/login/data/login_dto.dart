import '../domain/login_entity.dart';

class LoginDto extends LoginEntity {
  LoginDto({
    super.statusMsg,
    super.message,
    this.errorsDto,
    this.userDto,
    super.token,});

  LoginDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    errorsDto = json['errors'] != null ? LoginErrorsDto.fromJson(json['errors']) : null;
    userDto = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  LoginErrorsDto? errorsDto;
  LoginUserDto? userDto;




}

/// name : "Sayed Hashem"
/// email : "sayed@gmail.com"
/// role : "user"

class LoginUserDto extends LoginUser{
  LoginUserDto({
    super.name,
    super.email,
    super.role,});

  LoginUserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

}

/// msg : "Email is required"
/// param : "email"
/// location : "body"

class LoginErrorsDto extends LoginErrors {
  LoginErrorsDto({
    super.msg,
    super.param,
    super.location,});

  LoginErrorsDto.fromJson(dynamic json) {
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }


}