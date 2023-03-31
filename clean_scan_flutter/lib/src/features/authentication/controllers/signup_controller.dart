import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_nhk/src/repository/authentication_repository/user_repository/user_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../models/user_model.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository()) ;


  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) async {
    String? error =   await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }


  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }


}