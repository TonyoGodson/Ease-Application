import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/shared/screen_frame.dart';
import 'package:ease_app/view/authentication/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/customReusableButton.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  static const String routeName = "create_new_password_screen";
  const CreateNewPasswordScreen({
    required this.passedData,
    super.key});
  final String passedData;

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Scaffold(
        backgroundColor: ColorUtils.TRANSPARENT_,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: screenWidth(context) * .8,
                height: screenWidth(context) * .8,
                // color: ColorUtils.EASE_WHITE,
                child: Lottie.network(
                  'https://lottiefiles.com/animations/verify-Po4mYy6kMD',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: screenWidth(context) * .6,
                          height: screenWidth(context) * .6,
                          child: Image.asset(ImageUtils.createp,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Icon(Icons.error, color: Colors.red, size: 50),
                            SizedBox(height: 10),
                            Text("Failed to load animation", style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 100,),
            CustomReusableButton(
                buttonTitle: "Create New Password",
                titleColor: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                buttonColor: ColorUtils.EASE_BLUE,
                buttonHeight: 45,
                left: 18, right: 18,
                borderRadius: 10,
                function: (){
                  Navigator.of(context).pushNamed(ResetPasswordScreen.routeName,
                    arguments: widget.passedData
                  );
                }),
          ],
        ),
      ),
    );
  }
}
