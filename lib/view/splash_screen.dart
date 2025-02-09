import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/constants.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/shared/botton_nav.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:ease_app/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../data/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPrefService sharedPrefService = SharedPrefService();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      String? value = await sharedPrefService.readCache(Constants.LOGIN_KEY);
      if(value != null){
        print('value is null $value == null');
        Navigator.of(context).pushNamed(NavScreen.routeName, arguments: 0);
      } else {
        Navigator.of(context).pushNamed(OnboardingScreen.routeName);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.WHITE_COLOR,
      body: Center(
        child: Image.asset(ImageUtils.ease_logo),
      ),
    );
  }
}
