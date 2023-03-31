import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';


class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();


  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString() ,
        snackPosition: SnackPosition.BOTTOM ,
        backgroundColor: Colors.red.withOpacity(0.1)));

    } else {
      Get.snackbar(
          "Logged In",
          "Successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green
      );
    }
  }

}