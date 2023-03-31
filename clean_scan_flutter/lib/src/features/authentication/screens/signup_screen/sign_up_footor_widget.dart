import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../coming_soon/coming_soon.dart';
import '../dashboard/dashboard.dart';
import '../login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => Get.to(() => const ComingSoonScreen()),//{signUpWithGoogle();},
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            label: Text(tSignInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () => Get.to(() => const LoginScreen()),
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextSpan(text: tLogin.toUpperCase())
          ])),
        )
      ],
    );
  }


  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: googleUser!.email,
        password: googleUser.id,
      );
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);

      if (userCredential.user != null) {
        Get.offAll(() =>  Dashboard());
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: $e');
    } catch (e) {
      print('Error: $e');

    }

  }

}