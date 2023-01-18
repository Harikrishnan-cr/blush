// ignore_for_file: avoid_init_to_null

import 'dart:async';
import 'dart:developer';
import 'package:blush/service/register_services/register_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegisterScreenController extends GetxController {
  String? nameError = null;
  String? emailIdError = null;
  String? passwordError = null;
  String? confirmPasswordError = null;

  bool nameErrorIsvalid = false;
  bool emailIdErrorIsvalid = false;
  bool passwordErrorIsvalid = false;
  bool confirmPassWordErrorIsvalid = false;
  String? isValidText = null;

  bool isPassVisible = false;



void registerUserData({required String userEmail,required String userPassword,required BuildContext context})async{

await RegisterServices().registerUser(userEmail: userEmail, userPassword: userPassword,context: context); 

}

void isUserAccountAlreadyExist(){ 
  emailIdErrorIsvalid = false;
   emailIdError = 'Email already exists,you can try logging in with this email'; 
  
      update(); 
}


  void onPasswordVisible() {
    isPassVisible = !isPassVisible;

    update();
  }

  bool isFormValid = false;
  bool  checkIsValid()  {
    isFormValid = false;
    if (nameErrorIsvalid == true &&
        emailIdErrorIsvalid == true &&
        passwordErrorIsvalid == true &&
        confirmPassWordErrorIsvalid == true) {
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

  void onNameError(String value) {
    nameErrorIsvalid = false;
    if (value.isEmpty) {
      nameError = null;
      nameErrorIsvalid = false;
    } else if (value.length < 5) {
      nameError = 'Name Must Conatains 5 letter';
      nameErrorIsvalid = false;
    } else {
      nameErrorIsvalid = true;
      nameError = null;
    }
    update();
  }

  void onEmailError(String value) {
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
    confirmPassWordErrorIsvalid = false; 
   
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

  void onConfirmPasswordError(String value, String previusPassword) {
    confirmPassWordErrorIsvalid = false;
    if (value.isEmpty) {
      confirmPasswordError = null;
      confirmPassWordErrorIsvalid = false;
    } else if (value != previusPassword) {
      confirmPasswordError = 'Please make sure your passwords match';
      confirmPassWordErrorIsvalid = false;
    } else {
      confirmPasswordError = null;
      confirmPassWordErrorIsvalid = true;
    }
    update();
  }
}
