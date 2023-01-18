import 'dart:developer';

import 'package:blush/controller/register_screen_controller/register_controller.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/size/size.dart';
import 'package:blush/view/login_screen/login_screen.dart';
import 'package:blush/view/widgets/button/filled_button.dart';
import 'package:blush/view/widgets/text_feild/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static final nameTextController = TextEditingController();
  static final emailTextEditingController = TextEditingController();
  static final passWordTextEditingController = TextEditingController();
  static final confirmPassWordTextEditingController = TextEditingController();


  static void clearAllFeilds(){

    nameTextController.clear();
    emailTextEditingController.clear();
    passWordTextEditingController.clear();
    confirmPassWordTextEditingController.clear(); 
  }

  final registerControlers = Get.put(RegisterScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: commonColorYellow,
                size: 25,
              )),
          kWidth15,
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppHeading(),
              GetBuilder<RegisterScreenController>(
                  builder: (registerController) {
                return Column(
                  children: [
                    TextFeildCommonWidget(
                        onChanged: (value) {
                          registerController.onNameError(value);
                        },
                        errorMessages: registerController.nameError,
                        textEditingControllers: nameTextController,
                        labelText: 'Name',
                        preFixIcons: const Icon(
                          Icons.person_outline_outlined,
                          color: commonColorYellow,
                        )),
                    TextFeildCommonWidget(
                        onChanged: (value) {
                          registerController.onEmailError(value);
                        },
                        errorMessages: registerController.emailIdError,
                        textEditingControllers: emailTextEditingController,
                        labelText: 'Email',
                        preFixIcons: const Icon(
                          Icons.mail_outline,
                          color: commonColorYellow,
                        )),
                    TextFeildCommonWidget(
                      onChanged: (value) {
                        registerController.onPasswordError(value);
                      },
                      errorMessages: registerController.passwordError,
                      textEditingControllers: passWordTextEditingController,
                      labelText: 'Password',
                      preFixIcons: const Icon(
                        Icons.lock,
                        color: commonColorYellow,
                      ),
                      isVisible: !registerController.isPassVisible,
                      passwordIcons: GestureDetector(
                          onTap: () {
                            registerController.onPasswordVisible();
                          },
                          child: !registerController.isPassVisible
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: commonColorYellow,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: commonColorYellow,
                                )),
                    ),
                    TextFeildCommonWidget(
                      onChanged: (value) {
                        registerController.onConfirmPasswordError(
                            value, passWordTextEditingController.text);
                      },
                      errorMessages: registerController.confirmPasswordError,
                      textEditingControllers:
                          confirmPassWordTextEditingController,
                      labelText: 'Confirm password',
                      preFixIcons: const Icon(
                        Icons.lock,
                        color: commonColorYellow, 
                      ),
                      isVisible: true,
                    ),
                  ],
                );
              }),
              GetBuilder<RegisterScreenController>(builder: (regController) {
                return regController.isValidText != null
                    ? Text(
                        regController.isValidText!,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w400),
                      )
                    : const SizedBox();
              }),
              Column(
                children: [
                  InkWell(
                      onTap: ()  {
                       if(registerControlers.checkIsValid()){ 
registerControlers.registerUserData(userEmail: emailTextEditingController.text, userPassword: passWordTextEditingController.text,context: context);
//Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),)); 
                       }else{

log('In valid user'); 
                       }
                      },
                      child: const ButtonCommonFilledWidget(
                          buttonText: 'Register'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
