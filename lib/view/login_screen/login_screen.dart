import 'package:blush/controller/login_screen_controller/login_controller.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/core/size/size.dart';
import 'package:blush/service/login_services/login_services.dart';
import 'package:blush/view/register_screen/register_screen.dart';
import 'package:blush/view/widgets/button/filled_button.dart';
import 'package:blush/view/widgets/logo/animated_logo.dart';
import 'package:blush/view/widgets/text_feild/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static final emailTextController = TextEditingController();
  static final passTextWordController = TextEditingController();

  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight15,
            kHeight15,
            kHeight15,
            kHeight15,
            kHeight15,
            Hero(
              tag: 'logo',
              child: SizedBox(
                width: width * 0.6,
                height: height * 0.3,
                child: AppMainLogoWidget(
                  width: width,
                  height: height,
                  isReapet: true,
                ),
              ),
            ),
            const AppHeading(),
            kHeight15,
            GetBuilder<LoginController>(builder: (loginContoller) {
              return Column(
                children: [
                  TextFeildCommonWidget(
                    onChanged: (value) {
                      loginContoller.onEmailError(value: value);
                    },
                    errorMessages: loginContoller.emailIdError,
                    textEditingControllers: emailTextController,
                    labelText: 'Email',
                    preFixIcons: const Icon(
                      Icons.email_outlined,
                      color: commonColorYellow,
                    ),
                  ),
                  TextFeildCommonWidget(
                    isVisible: !loginContoller.isPassVisible,
                    onChanged: (value) {
                      loginContoller.onPasswordError(value);
                    },
                    errorMessages: loginContoller.passwordError,
                    textEditingControllers: passTextWordController,
                    labelText: 'Password',
                    passwordIcons: GestureDetector(
                        onTap: () {
                          loginController.onPasswordVisible();
                        },
                        child: loginContoller.isPassVisible
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: commonColorYellow,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: commonColorYellow,
                              )),
                    preFixIcons: const Icon( 
                      Icons.lock,
                      color: commonColorYellow,
                    ),
                  ),
                  loginContoller.isValidText != null
                      ? Text(
                          loginContoller.isValidText!,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w400),
                        )
                      : const SizedBox()
                ],
              );
            }),
            GetBuilder<LoginController>(builder: (logControler) {
              return !logControler.isLoading
                  ? GestureDetector(
                      onTap: () {
                        logControler.checkIsValid();
                        LoginServices().loginUser(
                            userEmail: emailTextController.text,
                            userPassword: passTextWordController.text,
                            context: context);
                      },
                      child:
                          const ButtonCommonFilledWidget(buttonText: 'Login')) 
                  : const CircularProgressIndicator(
                      color: commonColorYellow,
                      strokeWidth: 4,
                    );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
                  },
                  child: Text(
                    'or create an account',
                    style: GoogleFont.createAnAccountText,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppHeading extends StatelessWidget {
  const AppHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( 
      'BLUSH',
      style: GoogleFont.loginMainTextStle,
    );
  }
}
