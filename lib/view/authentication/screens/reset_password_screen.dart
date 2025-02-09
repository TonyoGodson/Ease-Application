import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/string_utils.dart';
import 'package:ease_app/shared/screen_frame.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../services/api_handler.dart';
import '../../../shared/customReusableButton.dart';
import '../../../shared/custom_reusable_textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = "reset_password_screen";
  const ResetPasswordScreen({
    required this.passedData,
    super.key});
  final String passedData;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();

  final  ValueNotifier<bool> _hidePassword = ValueNotifier<bool >(false);
  final  ValueNotifier<bool> _hideCPassword = ValueNotifier<bool >(false);
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(StringUtils.createANP,
                    style: nunitoSans(
                      context: context,
                      fs: 18,
                      fw: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(StringUtils.kindly,
                    style: nunitoSans(
                      context: context,
                      fs: 12,
                      fw: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: ColorUtils.EASE_DARK_RED,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text(StringUtils.char8,
                          style: nunitoSans(
                            context: context,
                            fs: 12,
                            fw: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: ColorUtils.EASE_DARK_RED,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text(StringUtils.symbol,
                          style: nunitoSans(
                            context: context,
                            fs: 12,
                            fw: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: ColorUtils.EASE_DARK_RED,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text(StringUtils.alpha,
                          style: nunitoSans(
                            context: context,
                            fs: 12,
                            fw: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(StringUtils.password,
                      style: nunitoSans(
                          context: context,
                          fs: 14,
                          ht: 2.0,
                          fw: FontWeight.w300
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20,),
                ValueListenableBuilder(
                    valueListenable: _hidePassword,
                    builder: (context, value, child){
                      return
                        CustomReusableTextField(
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          label: "********",
                          hint: "********",
                          leftMargin: 18,
                          rightMargin: 18,
                          maxLength: 45,
                          fontSize: 15,
                          borderRadius: 10,
                          borderColor: ColorUtils.TRANSPARENT_,
                          filled: true,
                          fillColor: ColorUtils.WHITE_COLOR,
                          passwordField: _hidePassword.value,
                          prefIcon: Icon(Icons.lock,
                            size: 16,
                          ),
                          sufIcon: SizedBox(
                            width: 10,
                            child: IconButton(
                                onPressed: (){
                                  _hidePassword.value = !_hidePassword.value;
                                }, icon: Icon(_hidePassword.value ? Icons.visibility:Icons.visibility_off,
                              size: 16,
                            )),
                          ),
                          onFieldSubmitted: (value){
                            onChangeFocusNode(context, _passwordFocusNode, _confirmPasswordFocusNode);
                          },
                          validator: (value) => passwordValidator(value),
                          // onChange: (value) => passwordValidator(value),
                        );
                    }),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(StringUtils.cPass,
                      style: nunitoSans(
                          context: context,
                          fs: 14,
                          ht: 2.0,
                          fw: FontWeight.w300
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20,),
                ValueListenableBuilder(
                    valueListenable: _hideCPassword,
                    builder: (context, value, child){
                      return
                        CustomReusableTextField(
                          focusNode: _confirmPasswordFocusNode,
                          controller: _confirmPasswordController,
                          label: "********",
                          hint: "********",
                          leftMargin: 18,
                          rightMargin: 18,
                          maxLength: 45,
                          fontSize: 15,
                          borderRadius: 10,
                          borderColor: ColorUtils.TRANSPARENT_,
                          filled: true,
                          fillColor: ColorUtils.WHITE_COLOR,
                          passwordField: _hideCPassword.value,
                          prefIcon: Icon(Icons.lock,
                            size: 16,
                          ),
                          sufIcon: SizedBox(
                            width: 10,
                            child: IconButton(
                                onPressed: (){
                                  _hideCPassword.value = !_hideCPassword.value;
                                }, icon: Icon(_hideCPassword.value ? Icons.visibility:Icons.visibility_off,
                              size: 16,
                            )),
                          ),
                          onFieldSubmitted: (value){
                            onChangeFocusNode(context, _confirmPasswordFocusNode, _submitFocusNode);
                          },
                          validator: (value) => cPasswordValidator(_passwordController.text, value),
                          // onChange: (value) => passwordValidator(value),
                        );
                    }),
                SizedBox(height: 100,),
                CustomReusableButton(
                    buttonTitle: "Reset password and sign in",
                    titleColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    buttonColor: ColorUtils.EASE_BLUE,
                    buttonHeight: 45,
                    left: 18, right: 18,
                    borderRadius: 10,
                    function: (){
                      _submit(context);
                    }),
              ],
            ),
          ),
        ));
  }

  _submit(BuildContext context) async {
    if(formKey.currentState!.validate()){
      Map<String, dynamic> data = {
        "otp": widget.passedData,
        "password": _passwordController.text.trim(),
      };
      bool done = await ApiHandler.resetPassword(context, data);
      if(done){
        _passwordController.clear();
        _confirmPasswordController.clear();
        Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName,
              (route) => false,);
      }
    }
  }
}
