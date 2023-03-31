class LogInWithEmailAndPasswordFailure {
  final String message;

  LogInWithEmailAndPasswordFailure({this.message = 'Something went wrong'});

  factory LogInWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(message: 'The email address is invalid.');
      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(message: 'The user account has been disabled by an administrator.');
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(message: 'There is no user record corresponding to this identifier. The user may have been deleted.');
      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(message: 'The password is invalid or the user does not have a password.');
      default:
        return LogInWithEmailAndPasswordFailure();
    }
  }
}