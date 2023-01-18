import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/view/login_screen/login_screen.dart';
import 'package:blush/view/register_screen/register_screen.dart';
import 'package:blush/view/widgets/button/filled_button.dart';
import 'package:blush/view/widgets/logo/animated_logo.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
   
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: 'logo',
                child: Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 8),
                  width: width * 0.4,
                  height: height * 0.2,
                  child: AppMainLogoWidget( 
                    width: width,
                    height: height,
                    isReapet: false,
                  ),
                ),
              ),
            ),
            const Center(child: AppHeading()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: GoogleFont.homeScreenText,
                  child: AnimatedTextKit(
                   
                   isRepeatingAnimation: false,   
                    animatedTexts: [
                      TyperAnimatedText('Always fulfilling your expectations',textStyle: const TextStyle(letterSpacing: 2)) 
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 100), 
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      child: const ButtonCommonFilledWidget(buttonText: 'Login')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                      },
                      child: const ButtonCommonFilledWidget(buttonText: 'Register')), 
                ],
              ),
            ),
            SizedBox(height: height * 0.2, child: const CreaterWidget())
          ],
        ),
      ),
    );
  }
}

class CreaterWidget extends StatelessWidget {
  const CreaterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'created by ©harikrishnan',
          style: TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    );
  }
}
