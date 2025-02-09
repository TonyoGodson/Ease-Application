import 'dart:async';

import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/core/utils/string_utils.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:ease_app/view/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/color_utils.dart';
import '../../shared/customReusableButton.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding_screen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int _currentIndex = 0;
  final List<String> images = [
    ImageUtils.onb1,
    ImageUtils.onb2,
    ImageUtils.onb3,
    ImageUtils.onb4,
  ];

  final List<Map<String, dynamic>> texts = [
    {"title": StringUtils.lorem1, "subtitle": StringUtils.lorem1b},
    {"title": StringUtils.lorem2, "subtitle": StringUtils.lorem2b},
    {"title": StringUtils.lorem3, "subtitle": StringUtils.lorem3b},
    {"title": StringUtils.lorem4, "subtitle": StringUtils.lorem4b}
  ];
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(_currentIndex),
              width: screenWidth(context),
              height: screenHeight(context),
              child: Image.asset(
                images[_currentIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Column(
                  key: ValueKey<int>(_currentIndex),
                  children: [
                    SizedBox(
                      width: screenWidth(context) * .8,
                      child: Text(texts[_currentIndex]["title"],
                        style: nunitoSans(
                            c: ColorUtils.WHITE_COLOR,
                            context: context,
                            fs: 22,
                            ht: 0.0,
                            fw: FontWeight.w700
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: screenWidth(context) * .8,
                      child: Text(texts[_currentIndex]["subtitle"],
                        style: nunitoSans(
                            c: ColorUtils.WHITE_COLOR,
                            context: context,
                            fs: 12,
                            fw: FontWeight.normal
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              CustomReusableButton(
                  buttonTitle: "SIGN UP",
                  titleColor: ColorUtils.WHITE_COLOR,
                  fontWeight: FontWeight.bold,
                  buttonColor: ColorUtils.EASE_BLUE,
                  fontSize: 12,
                  buttonHeight: 45,
                  left: 18, right: 18,
                  borderRadius: 5,
                  function: (){
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  }),
              SizedBox(height: 15,),
              CustomReusableButton(
                  buttonTitle: "LOGIN",
                  titleColor: ColorUtils.EASE_BLUE,
                  fontWeight: FontWeight.bold,
                  buttonColor: ColorUtils.WHITE_COLOR,
                  fontSize: 12,
                  buttonHeight: 45,
                  left: 18, right: 18,
                  borderRadius: 5,
                  function: (){
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  }),
              SizedBox(height: 50,)
            ],
          )
        ],
      ),
    );
  }
}
