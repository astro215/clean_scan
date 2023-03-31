import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_nhk/src/features/authentication/screens/splash_screen/splash_screen.dart';


import '../../features/authentication/screens/dashboard/dashboard.dart';
import '../../features/authentication/screens/welcome/welcome_screen.dart';
import 'exceptions/login_with_email_password_failure.dart';
import 'exceptions/signup_email_passoword_failure.dart';



class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() =>  Dashboard());
  }


  //FUNC
  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() =>  Dashboard()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase auth error: ${ex.message}');
      return ex.message;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      print('Firebase auth error: ${ex.message}');
      return ex.message;
    }
    return null;
  }


  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() =>  Dashboard()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      print('Firebase auth error: ${ex.message}');
      return ex.message;
    } catch (_) {
      final ex = LogInWithEmailAndPasswordFailure();
      print('Firebase auth error: ${ex.message}');
      return ex.message;
    }
    return null;
  }



  Future<void> logout() async => await _auth.signOut();
}


