import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/core/utils/string_utils.dart';
import 'package:ease_app/shared/screen_frame.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:ease_app/view/authentication/screens/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/api_handler.dart';
import '../../../shared/customReusableButton.dart';
import '../../../shared/custom_reusable_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "forgot_password_screen";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool disabled = true;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Scaffold(
        backgroundColor: ColorUtils.TRANSPARENT_,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: ColorUtils.EASE_BLUE,
                  child: SvgPicture.asset(ImageUtils.open,
                    width: 40,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(StringUtils.fpass,
                  style: nunitoSans(
                    context: context,
                    fs: 17,
                    fw: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(StringUtils.rest,
                  style: nunitoSans(
                    context: context,
                    fs: 12,
                    fw: FontWeight.w300
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringUtils.email,
                    style: nunitoSans(
                        context: context,
                        fs: 14,
                        ht: 2.0,
                        fw: FontWeight.w300
                    ),
                  ),
                ),
              ),
              CustomReusableTextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                label: "user@email.com",
                hint: "user@email.com",
                leftMargin: 18,
                rightMargin: 18,
                borderRadius: 10,
                maxLength: 45,
                fontSize: 15,
                borderColor: ColorUtils.TRANSPARENT_,
                filled: true,
                fillColor: ColorUtils.WHITE_COLOR,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value){
                  onChangeFocusNode(context, _emailFocusNode, _submitFocusNode);
                },
                validator: (value) => emailValidator(value),
                onChange: (value){
                  setState(() {
                    if(value!.isNotEmpty){
                      setState(() {
                        disabled = false;
                        emailValidator(value);
                      });
                    } else {
                      setState(() {
                        disabled = true;
                        emailValidator(value);
                      });
                    }
                  });
                },
              ),
              SizedBox(height: 180,),
              CustomReusableButton(
                disabled: disabled,
                  buttonTitle: "Send Code",
                  titleColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  buttonColor: ColorUtils.EASE_BLUE,
                  buttonHeight: 45,
                  left: 18, right: 18,
                  borderRadius: 10,
                  function: disabled?(){}:(){
                    _submit(context);
                  }),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringUtils.remember,
                    style: nunitoSans(
                        context: context,
                        fs: 13,
                        fw: FontWeight.w300
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0,
                                color: ColorUtils.EASE_BLUE
                            )
                        )
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: Text(StringUtils.login,
                        style: nunitoSans(
                            c: ColorUtils.EASE_BLUE,
                            context: context,
                            fs: 14,
                            fw: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  _submit(BuildContext context) async {
    if(formKey.currentState!.validate()){
      Map<String, dynamic> data = {
        "email": _emailController.text,
      };
      bool done = await ApiHandler.forgotPassword(context, data);
      if(done){
        Navigator.of(context).pushNamed(OtpVerificationScreen.routeName,
          arguments: _emailController.text
        );
        _emailController.clear();
      }
    }
  }
}
