
import 'package:ease_app/shared/past_bookings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../shared/botton_nav.dart';
import '../../shared/not_fount_screen.dart';
import '../../view/authentication/screens/create_new_password_screen.dart';
import '../../view/authentication/screens/forgot_password_screen.dart';
import '../../view/authentication/screens/login_screen.dart';
import '../../view/authentication/screens/otp_verification_screen.dart';
import '../../view/authentication/screens/reset_password_screen.dart';
import '../../view/authentication/screens/sign_up_screen.dart';
import '../../view/dashboard/home_screen.dart';
import '../../view/dashboard/past_bookings_details_screen.dart';
import '../../view/dashboard/past_bookings_see_all_screen.dart';
import '../../view/onboarding/onboarding_screen.dart';
import '../../view/splash_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  var args = settings.arguments;
  switch (settings.name){

    case NavScreen.routeName:
      return _pageBuilder(
              (context) => NavScreen(
                screenNumber: args as int,
              ),
          settings: settings);

    case HomePage.routeName:
      return _pageBuilder(
              (context) => HomePage(),
          settings: settings);

    case SignUpScreen.routeName:
      return _pageBuilder(
              (context) => SignUpScreen(),
          settings: settings);

    case LoginScreen.routeName:
      return _pageBuilder(
              (context) => LoginScreen(),
          settings: settings);

    case PastBookingsDetailsScreen.routeName:
      return _pageBuilder(
              (context) => PastBookingsDetailsScreen(
              pastBookingsListModel: args as PastBookingsListModel,
              ),
          settings: settings);

    case PastBookingsSeeAllScreen.routeName:
      return _pageBuilder(
              (context) => PastBookingsSeeAllScreen(),
          settings: settings);

    case ForgotPasswordScreen.routeName:
      return _pageBuilder(
              (context) => ForgotPasswordScreen(),
          settings: settings);

    case OtpVerificationScreen.routeName:
      return _pageBuilder(
              (context) => OtpVerificationScreen(
                passedEmail: args as String,
              ),
          settings: settings);

    case CreateNewPasswordScreen.routeName:
      return _pageBuilder(
              (context) => CreateNewPasswordScreen(
                passedData: args as String,
              ),
          settings: settings);

    case ResetPasswordScreen.routeName:
      return _pageBuilder(
              (context) => ResetPasswordScreen(
                passedData: args as String,
              ),
          settings: settings);

    case OnboardingScreen.routeName:
      return _pageBuilder(
              (context) => OnboardingScreen(),
          settings: settings);

    case SplashScreen.routeName:
      return _pageBuilder(
              (context) => SplashScreen(),
          settings: settings);




    default:
      print("Page doesn't exist");
      return _pageBuilder(
          (_) => const NotFountScreen(),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
    Widget Function(BuildContext) page, {
      required RouteSettings settings,
 }) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      pageBuilder: (context, _, __) => page(context),
  );
}