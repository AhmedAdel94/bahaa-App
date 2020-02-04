abstract class AuthState {}

// class UserIs extends AuthState {
//   AuthUser user;
//   UserIs(this.user);
// }

class IsEmailValid extends AuthState {
  bool isValid;
  IsEmailValid(this.isValid);
}

class PasswordResetIs extends AuthState {
  bool success;
  PasswordResetIs(this.success);
}

class UserIsLoggedOut extends AuthState {}

class UserStateIs extends AuthState {
  // UserState state;
  // UserStateIs(this.state);
}

class UserUpdated extends AuthState {
  // User user;
  // UserUpdated(this.user);
}
