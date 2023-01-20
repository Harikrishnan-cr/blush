import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blush/controller/main_catagory_controller/main_catgory_controller.dart';
import 'package:blush/controller/sub_catagory_controller/sub_catagory_controller.dart';
import 'package:blush/core/app_models/app_model.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/view/app_home/home_main.dart';
import 'package:blush/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool user = false;
final mainCatgoryController = Get.put(MainCatagoryController());
final subCatgoryController = Get.put(SubCatagoryController());
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    mainCatgoryController.addToCatagories(data: AppModelClass.catModelList); 
    subCatgoryController.addToSubCatagories(data: AppModelClass.subCatagoryList); 
    isUserLogedIn();
    super.initState();
  }

  void isUserLogedIn() {
    final fireBaseAuth = FirebaseAuth.instance;
    try {
      final isUserLog = fireBaseAuth.currentUser;

      if (isUserLog != null) {
        log(isUserLog.email.toString());
        setState(() {
          user = true;
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: Colors.black),
        home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.black,
          duration: 3000,
          splash: Column(
            children: [
              const Center(child: SplashHeading()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: GoogleFont.splashScreenText,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText('Always fulfilling your expectations',
                            textStyle: const TextStyle(
                                color: commonColorYellow,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          nextScreen: !user ? const HomeScreen() : const MainHomeScreen(),
        ));
  }
}

class SplashHeading extends StatelessWidget {
  const SplashHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'BLUSH',
      style: GoogleFont.splashScreenMainText,
    );
  }
}
