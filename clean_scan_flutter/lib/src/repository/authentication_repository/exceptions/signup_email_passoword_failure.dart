class SignUpWithEmailAndPasswordFailure {
  final String message;

  SignUpWithEmailAndPasswordFailure({this.message = 'Something went wrong'});

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(message: 'The password provided is too weak.');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(message: 'The email address is invalid.');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(message: 'Operation not allowed.');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(message: 'The account already exists for that email.');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(message: 'The user account has been disabled by an administrator.');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}