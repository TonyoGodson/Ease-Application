import 'package:ease_app/core/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../authentication/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorUtils.EASE_BLUE,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName,
                      (route) => false,);
              },
              icon: Icon(
                Icons.logout_rounded,
                color: ColorUtils.WHITE_COLOR,
              ))
        ],
      ),
    );
  }
}
