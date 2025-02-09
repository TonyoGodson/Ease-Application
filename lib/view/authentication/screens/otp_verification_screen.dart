import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../../../core/utils/color_utils.dart';
import '../../../core/utils/helper.dart';
import '../../../core/utils/image_utils.dart';
import '../../../core/utils/string_utils.dart';
import '../../../services/api_handler.dart';
import '../../../shared/customReusableButton.dart';
import '../../../shared/screen_frame.dart';
import 'create_new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const String routeName = "otp_verification_screen";
  const OtpVerificationScreen({
    required this.passedEmail,
    super.key});
  final String passedEmail;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  var emailNotifier = EmailNotifier("test@example.com");
  bool disabled = true;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
   emailNotifier = EmailNotifier(widget.passedEmail);
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
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
                  child: SvgPicture.asset(ImageUtils.envelop,
                    width: 40,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(StringUtils.checkib,
                  style: nunitoSans(
                      context: context,
                      fs: 17,
                      fw: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: StringUtils.wehave1,
                        style: nunitoSans(
                            context: context,
                            fs: 12,
                            fw: FontWeight.w300
                        )
                    ),
                    TextSpan(
                      text: widget.passedEmail,
                        style: nunitoSans(
                          c: ColorUtils.LIGHT_EASE_BLUE,
                            context: context,
                            fs: 12,
                            fw: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: StringUtils.wehave2,
                        style: nunitoSans(
                            context: context,
                            fs: 12,
                            fw: FontWeight.w300
                        )
                    ),
                  ]
                ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringUtils.entervc,
                    style: nunitoSans(
                        context: context,
                        fs: 14,
                        ht: 2.0,
                        fw: FontWeight.w300
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Pinput(
                  length: 6,
                  controller: _otpController,
                  obscureText: false,
                  obscuringCharacter: "◉",
                  onChanged: (String? value) {
                    if (value!.length == 6) {
                      setState(() {
                        disabled = false;
                      });
                    } else {
                      if (!disabled) {
                        setState(() {
                          disabled = true;
                        });
                      }
                    }
                  },
                  onCompleted: (String? value) {
                    // Navigator.of(context).pushNamed(AddLocationScreen.routeName);
                  },
                  defaultPinTheme: PinTheme(
                    width: 45,
                    height: 45,
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      // borderRadius: BorderRadius.circular(8),
                      color: ColorUtils.EASE_DARK_WHITE,
                      // border: Border.all(color: ColorUtils.APP_GREEN_LIGHT),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 35,
                    height: 35,
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: ColorUtils.EASE_DARK_WHITE,
                      // border: Border.all(color: ColorUtils.APP_GREEN_LIGHT),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 180,),
              CustomReusableButton(
                  disabled: disabled,
                  buttonTitle: "Continue",
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
              Align(
                alignment: Alignment.center,
                child: Text(StringUtils.didntreceive,
                  style: nunitoSans(
                      context: context,
                      fs: 12,
                      fw: FontWeight.w300
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                    onTap: () async {
                      Map<String, dynamic> data = {
                        "email": widget.passedEmail,
                      };
                      bool done = await ApiHandler.forgotPassword(context, data);
                      if(done){
                        _otpController.clear();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(StringUtils.resend,
                        style: nunitoSans(
                            c: ColorUtils.EASE_BLUE,
                            context: context,
                            fs: 12,
                            fw: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submit(BuildContext context) async {
    // if(formKey.currentState!.validate()){
      // Map<String, dynamic> data = {
      //   "email": _otpController.text,
      // };
      // bool done = await ApiHandler.forgotPassword(context, data);
      // if(done){
      //   _otpController.clear();
        Navigator.of(context).pushNamed(CreateNewPasswordScreen.routeName,
            arguments: _otpController.text);
      // }
    // }
  }
}

