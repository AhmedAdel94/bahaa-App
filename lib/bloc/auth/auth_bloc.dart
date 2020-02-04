import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'dart:io';

import 'package:bahaa2/bloc/auth/auth_event.dart';
import 'package:bahaa2/bloc/auth/auth_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart' ;

import '../bloc.dart';

class AuthBloc extends BLoC<AuthEvent> {
  ///// Singleton
  static AuthBloc _authBloc;
  // GraphCall grapCall = GraphCall();

  static AuthBloc instance() {
    if (_authBloc == null) {
      _authBloc = AuthBloc._();
    }
    return _authBloc;
  }

  AuthBloc._();

  String userPhone;
  String userDialCode;
  int recursionCount = 0;
  bool signingUp = false;
  PublishSubject<AuthState> authStateSubject = PublishSubject();

  @override
  void dispatch(AuthEvent event) async {
    if (event is LogoutTapped) {
      _logOut();
    }
    if (event is ResetPasswordTapped) {
      //await _resetPassword(event.email);
    }
    if (event is LoginTapped) {
      if (event.loginType == LoginType.withEmail) {
        //_loginWithEmail(event);
      }
      if (event.loginType == LoginType.withGoogle) {
        _loginWithGoogle();
      }
      if (event.loginType == LoginType.withGoogle) {
        //_loginWithFacebook();
      }
    }
    if (event is CheckUserState) {}
    // if (event is SignUpTapped) {
    //   _signUpWithEmail(event).catchError((e) {
    //     print(e);
    //   });
    // }
  }

  // Future<void> _loginWithFacebook() async {
  //   final facebookLogin = FacebookLogin();
  //   final result = await facebookLogin.logIn(['email']);

  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       // _sendTokenToServer(result.accessToken.token);
  //       // _showLoggedInUI();
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       //_showCancelledMessage();
  //       break;
  //     case FacebookLoginStatus.error:
  //       //_showErrorOnUI(result.errorMessage);
  //       break;
  //   }
  // }

  Future<void> _loginWithGoogle() async {
    print('login with google is tapped');
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
    // AuthUser user = await _authProvider.loginWith(
    //     method: MethodsType.googleMethod, callType: GraphCall());
    // if (user != null) {
    //   authStateSubject.add(LoginCompleted(user));
    //   // grapCall.saveUser(user);
    // }

    // await netFunc(
    //   () async {
    //     try {
    //       AuthUser user = await _authProvider.loginWith(
    //           method: MethodsType.googleMethod, callType: GraphCall());
    //       if (user != null) {
    //         // authStateSubject.add(UserIs(user));
    //         print("login completed");
    //         // grapCall.saveUser(user);
    //       }
    //       ErrorBloc.push(
    //           LocalError(0, AppStrings.signInWithGoogleFailed, "", "Google"));
    //     } catch (e) {
    //       ErrorBloc.push(
    //           LocalError(0, AppStrings.signInWithGoogleFailed, "", "Google"));
    //     }
    //   },
    // );

    // AuthUser user = await _authProvider.loginWith(method: GoogleAuthMethod());
    // if (user != null) {
    //   print("Login Completed");
    // }

    // print("Credentials are ${user.credintials}");
  }

  // Future<bool> _resetPassword(String email) async {
  //   bool sent;
  //   await netFunc(() async {
  //     sent = true;
  //     print(email);
  //     authStateSubject.sink.add(PasswordResetIs(sent));
  //   });
  //   return sent;
  // }

  // Future<void> _loginWithEmail(LoginTapped event) async {
  //   AuthUser user = await _authProvider.loginWith(
  //       method:
  //           EmailLoginMethod(event.email, event.password, AppStrings.apiLink),
  //       callType: GraphCall(AppStrings.apiLink, AppStrings.loginAuthNode));
  //   authStateSubject.add(UserIs(user));
  // }

  // Future<void> _signUpWithEmail(SignUpTapped event) async {
  //   netFunc(() async {
  //     AuthUser user = await _authProvider.loginWith(
  //         method: EmailSignupMethod(
  //             event.email, event.password, event.password, AppStrings.apiLink),
  //         callType: GraphCall(AppStrings.apiLink, AppStrings.signUpUserNode));
  //     authStateSubject.add(UserIs(user));
  //   });
  // }

  // Future<bool> _resetPassword(String email) async {
  //   await netFunc(() async {});
  // }

  /*
   * Edit requester's profile info (including email which will need re-verification)
   */
  Future<void> _editProfile(
      {String email, String dialCode, String phone, String password}) async {}

  dispose() {
    authStateSubject.close();
    _authBloc = null;
  }

  _logOut() async {
    //UserProvider.instance().dispose();
    await removeUser();
    authStateSubject.add(UserIsLoggedOut());
  }

  removeUser() async {}
}
