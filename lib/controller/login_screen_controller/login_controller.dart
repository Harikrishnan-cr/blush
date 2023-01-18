// ignore_for_file: avoid_init_to_null

import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String? emailIdError;
  String? passwordError;

  bool emailIdErrorIsvalid = false;
  bool passwordErrorIsvalid = false;

  String? isValidText;
  bool isLoading = false;
  bool isPassVisible = false;

  void onPasswordVisible() {
    isPassVisible = !isPassVisible;

    update();
  }

  void isUserInavalid() {
    emailIdError = 'Incorrect email or password';
    passwordError = 'Incorrect email or password';
//isValidText = 'Incorrect email or password';
    timerMessage();
    update();
  }

  void isLoadingMeathode(bool value) {
    isLoading = value;
    update();
  }

  bool isFormValid = false;
  bool checkIsValid() {
    isFormValid = false;
    if (emailIdErrorIsvalid == true && passwordErrorIsvalid == true) {
      isFormValid = true;
      log('is true');
      return true;
    } else {
      log('isnot');
      isValidText = 'All feilds are required';
      timerMessage();

      update();
      return false;
    }
  }

  Future timerMessage() async {
    Timer(
      const Duration(seconds: 5),
      () {
        log('after 5 seconds');
        isValidText = null;
        emailIdError = null;
        passwordError = null;
        update();
      },
    );
  }

  Future timerMessageLoginSpecial() async {
    Timer(
      const Duration(seconds: 5),
      () {
        log('after 5 seconds');
        isValidText = null;
        update();
      },
    );
  }

  bool isEmailValid(email) {
    String emailData =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailData);

    return regExp.hasMatch(email);
  }

  void onEmailError({required String value}) {
    emailIdErrorIsvalid = false;
    if (value.isEmpty) {
      emailIdError = null;
      emailIdErrorIsvalid = false;
    } else if (isEmailValid(value) == true) {
      emailIdError = null;
      emailIdErrorIsvalid = true;
    } else {
      emailIdError = 'Enter a valid email address';
      emailIdErrorIsvalid = false;
    }
    update();
  }

  void onPasswordError(String value) {
    String passwordDataUpparcase =
        r'^(?=.*[A-Z])'; // should contain at least one upper case
    String passwordDataLowerCase =
        r'^(?=.*?[a-z])'; // should contain at least one lower case
    String passwordDataNumber =
        r'^(?=.*?[0-9])'; // should contain at least one digit
    String passwordDataSpecialChar =
        r'^(?=.*?[!@#\$&*~])'; // should contain at least one Special character
    String passwordDataLength =
        r'^.{8,}$'; // Must be at least 8 characters in length

    RegExp regExpUppercase = RegExp(passwordDataUpparcase);
    RegExp regExpLowercase = RegExp(passwordDataLowerCase);
    RegExp regExpNumber = RegExp(passwordDataNumber);
    RegExp regExpSpecialChar = RegExp(passwordDataSpecialChar);
    RegExp regExpLength = RegExp(passwordDataLength);
    passwordErrorIsvalid = false;

    if (value.isEmpty) {
      passwordError = null;
      passwordErrorIsvalid = false;
    } else if (!regExpUppercase.hasMatch(value)) {
      passwordError = 'should contain at least one upper case ';
      passwordErrorIsvalid = false;
    }
    //-------------- Lowecase condetion ------------------

    else if (!regExpLowercase.hasMatch(value)) {
      passwordError = 'should contain at least one lower case';
      passwordErrorIsvalid = false;
    }

    //-------------- Number condetion ------------------

    else if (!regExpNumber.hasMatch(value)) {
      passwordError = 'should contain at least one digit';
      passwordErrorIsvalid = false;
    }

    //-------------- Special Char condetion ------------------

    else if (!regExpSpecialChar.hasMatch(value)) {
      passwordError = 'should contain at least one Special character';
      passwordErrorIsvalid = false;
    }

    //-------------- Length condetion ------------------

    else if (!regExpLength.hasMatch(value)) {
      passwordError = 'Must be at least 8 characters in length';
      passwordErrorIsvalid = false;
    } else {
      passwordError = null;
      passwordErrorIsvalid = true;
    }

    update();
  }
}
