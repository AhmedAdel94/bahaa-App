import 'dart:io';

abstract class AuthEvent {}

enum LoginType { withGoogle, withEmail, withFacebook }

class SignUpTapped extends AuthEvent {
  String email, password;
  SignUpTapped({
    this.email,
    this.password,
  });
}

class LoginTapped extends AuthEvent {
  String email, password;
  LoginType loginType;
  LoginTapped(this.loginType, {this.email, this.password});
}

class ResetPasswordTapped extends AuthEvent {
  String email;
  ResetPasswordTapped(this.email);
}

class LogoutTapped extends AuthEvent {}

class CheckUserState extends AuthEvent {}

class UpdateUser extends AuthEvent {
  String postalCode, phoneNumber, password, email;
  File image;
  UpdateUser(
      {this.postalCode,
      this.phoneNumber,
      this.email,
      this.password,
      this.image});
}
