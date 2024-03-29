import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'dart:io';

import 'package:bahaa2/bloc/auth/auth_event.dart';
import 'package:bahaa2/bloc/auth/auth_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../bloc.dart';

class AuthBloc extends BLoC<AuthEvent> {
  ///// Singleton
  static AuthBloc _authBloc;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // GraphCall grapCall = GraphCall();
  String authMethod = "";

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
    if (event is SignUpTapped) {
      _signUpWithEmail(event);
    }

    if (event is LogoutTapped) {
      _logOut();
    }
    if (event is ResetPasswordTapped) {
      await _resetPassword(event.email);
    }
    if (event is LoginTapped) {
      if (event.loginType == LoginType.withEmail) {
        _loginWithEmail(event);
        authMethod = "email";
      }
      if (event.loginType == LoginType.withGoogle) {
        _loginWithGoogle();
        authMethod = "google";
      }
      if (event.loginType == LoginType.withFacebook) {
        _loginWithFacebook();
        authMethod = "facebook";
      }
    }
    if (event is CheckUserState) {}
    // if (event is SignUpTapped) {
    //   _signUpWithEmail(event).catchError((e) {
    //     print(e);
    //   });
    // }
  }

  Future<void> _loginWithFacebook() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // _sendTokenToServer(result.accessToken.token);
        print(result.accessToken.token);
        authStateSubject.sink.add(LoginCompleted());
        // _showLoggedInUI();
        break;
      case FacebookLoginStatus.cancelledByUser:
        //_showCancelledMessage();
        break;
      case FacebookLoginStatus.error:
        //_showErrorOnUI(result.errorMessage);
        break;
    }
  }

  Future<void> _loginWithGoogle() async {
    print('login with google is tapped');
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        print(user.displayName);
        authStateSubject.sink.add(LoginCompleted());
      }
    } catch (error) {
      print(error);
    }
  }

  Future<bool> _resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    authStateSubject.sink.add(PasswordResetMailSent(true));
  }

  Future<void> _loginWithEmail(LoginTapped event) async {
    AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: event.email, password: event.password)
        .catchError((error) {
      throw error.toString();
    });
    FirebaseUser fuser = result.user;
    if (fuser != null) {
      print("Logged in");
      authStateSubject.sink.add(LoginCompleted());
    }
  }

  Future<void> _signUpWithEmail(SignUpTapped event) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: event.email,
      password: event.password,
    ))
        .user;
    authStateSubject.sink.add(SignUpCompleted());
  }

  // Future<bool> _resetPassword(String email) async {
  //   await netFunc(() async {});
  // }

  /*
   * Edit requester's profile info (including email which will need re-verification)
   */

  dispose() {
    authStateSubject.close();
    _authBloc = null;
  }

  _logOut() async {
    if (authMethod == "email") {
      //Firebase logout
      await FirebaseAuth.instance.signOut();
      authStateSubject.add(UserIsLoggedOut());
      print("Email logout");
    }
    if (authMethod == "google") {
      //google logout
      GoogleSignIn _googleSignIn = GoogleSignIn();
      _googleSignIn.signOut();
      authStateSubject.add(UserIsLoggedOut());
      print("google logout");
    }
    if (authMethod == "facebook") {
      //facebook logout
      final facebookLogin = FacebookLogin();
      await facebookLogin.logOut();
      authStateSubject.add(UserIsLoggedOut());
      print("facebook logout");
    }
  }

  removeUser() async {}
}
