import 'package:ease_app/core/routers/router.dart';
import 'package:ease_app/model_view/auth_view_model.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:ease_app/view/authentication/screens/sign_up_screen.dart';
import 'package:ease_app/view/onboarding/onboarding_screen.dart';
import 'package:ease_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
      ),
    ],
      child: MaterialApp(
        title: 'Ease',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const LoginScreen(),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

