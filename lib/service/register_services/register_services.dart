import 'dart:developer';

import 'package:blush/controller/register_screen_controller/register_controller.dart';
import 'package:blush/view/login_screen/login_screen.dart';
import 'package:blush/view/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterServices {
  final fireBaseAuth = FirebaseAuth.instance;

  final registerController = Get.put(RegisterScreenController());

  Future registerUser(
      {required String userEmail,
      required String userPassword,
      required BuildContext context}) async {
    try {
      await fireBaseAuth
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword)
          .whenComplete(
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  )));
      RegisterScreen.clearAllFeilds();
    } catch (e) {
      registerController.isUserAccountAlreadyExist();
      log(e.toString());
    }
  }
}
