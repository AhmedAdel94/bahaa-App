import 'package:bahaa2/PODO/Customer.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

/// EVENT : AppLaunched
/// When auth is checked, if both parameters are null, then there is no current user
class AuthChecked extends AuthState {
  final Customer user;
  final FirebaseUser fUser;

  AuthChecked(this.user, this.fUser);
}

/// EVENT : Login
/// When User is successfully logged in
class LoginCompleted extends AuthState {
  Customer user;
  LoginCompleted(this.user);
}

/// EVENT : ResetPassword
/// When Reset password function is completed, a boolean is returned to this state
/// which indicates whether the mail was sent successfully or not
class PasswordResetMailSent extends AuthState {
  bool success;
  PasswordResetMailSent(this.success);
}

/// EVENT : Logout
/// When user is logged out and removed from app
class UserIsLoggedOut extends AuthState {}

/// EVENT : PhoneVerificationCodeEntered || SignupTapped
/// When Sign up is finished successfully (whether for Performer or Requester)
class SignUpCompleted extends AuthState {
  Customer user;
  SignUpCompleted(this.user);
}
