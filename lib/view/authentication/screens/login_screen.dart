import 'dart:convert';

import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/constants.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/core/utils/string_utils.dart';
import 'package:ease_app/data/shared_preferences.dart';
import 'package:ease_app/model_view/auth_view_model.dart';
import 'package:ease_app/services/api_handler.dart';
import 'package:ease_app/shared/botton_nav.dart';
import 'package:ease_app/shared/customReusableButton.dart';
import 'package:ease_app/shared/custom_reusable_textfield.dart';
import 'package:ease_app/shared/reusable_checkbox.dart';
import 'package:ease_app/shared/screen_frame.dart';
import 'package:ease_app/view/authentication/screens/forgot_password_screen.dart';
import 'package:ease_app/view/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../shared/custom_checkbox.dart';
import '../../dashboard/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPrefService sharedPrefService = SharedPrefService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();
  final  ValueNotifier<bool> _hidePassword = ValueNotifier<bool >(false);
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fetchRememberMe();
    super.initState();
  }

  fetchRememberMe() async {
    Future.delayed(Duration.zero, () async {
      context.read<AuthViewModel>().rememberMe =
          (await sharedPrefService.readRememberMe(Constants.REMEMBER_ME)) ?? false;
  });

  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: ColorUtils.TRANSPARENT_,
          // appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringUtils.welcome,
                  style: nunitoSans(
                    context: context,
                    fs: 18,
                    ht: 2.0,
                    fw: FontWeight.bold
                  ),
                ),
                Text(StringUtils.book,
                  style: nunitoSans(
                    context: context,
                    fs: 14,
                    ht: 2.0,
                    fw: FontWeight.normal
                  ),
                ),
                SizedBox(height: 40,),
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
                    onChangeFocusNode(context, _emailFocusNode, _passwordFocusNode);
                  },
                  validator: (value) => emailValidator(value),
                  onChange: (value){
                    setState(() {
                      emailValidator(value);
                    });
                  },
                ),
                SizedBox(height: 10,),
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
                      label: "Password",
                      hint: "Password",
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
                        onChangeFocusNode(context, _passwordFocusNode, _submitFocusNode);
                      },
                      // validator: (value) => passwordValidator(value),
                      onChange: (value) => passwordValidator(value),
                    );
                }),
                // SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: RememberMeCheckbox()
                        // Row(
                        //   children: [
                        //     Text(StringUtils.rememberme,
                        //       style: nunitoSans(
                        //           context: context,
                        //           fs: 12
                        //       ),
                        //     ),
                        //     ReusableCheckBox(
                        //       circle: false,
                        //       borderRadius: 4,
                        //       checked: context.read<AuthViewModel>().rememberMe??false,
                        //       borderUncheckColor: ColorUtils.EASE_BLUE,
                        //       backgroundColor: ColorUtils.EASE_BLUE,
                        //     )
                        //   ],
                        // ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 140,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.5)
                            )
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
                          },
                          icon: Text(StringUtils.fpassword,
                            style: nunitoSans(
                              context: context,
                              fs: 12
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                CustomReusableButton(
                    buttonTitle: "Log in",
                    titleColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    buttonColor: ColorUtils.EASE_BLUE,
                    buttonHeight: 45,
                    left: 18, right: 18,
                    borderRadius: 10,
                    function: (){
                      _submit(context);
                    }),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringUtils.donthave,
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
                          Navigator.of(context).pushNamed(SignUpScreen.routeName);
                        },
                        child: Text(StringUtils.signup,
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
                SocialBtns()
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
        "password": _passwordController.text
      };
      bool done = await ApiHandler.loginToApp(context, data);
      if(done){
        _emailController.clear();
        _passwordController.clear();
        Navigator.of(context).pushNamed(NavScreen.routeName, arguments: 0);
        if(context.read<AuthViewModel>().rememberMe??false){
          sharedPrefService.writeCache(Constants.LOGIN_KEY,
              context.read<AuthViewModel>().loginResponse!);
        }else {
          print('false');
        }
      }
    }
  }
}











class SocialBtns extends StatelessWidget {
  const SocialBtns({
    this.login,
    super.key});
  final bool? login;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                indent: 18,
                endIndent: 5,
                color: ColorUtils.TEXT_GREY,
              ),
            ),
            Text(StringUtils.or,
              style: nunitoSans(
                  context: context,
                  fs: 15,
                  fw: FontWeight.bold
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                indent: 5,
                endIndent: 18,
                color: ColorUtils.TEXT_GREY,
              ),
            ),
          ],
        ),
        Text(login??true ? StringUtils.logw:StringUtils.signW,
          style: nunitoSans(
              context: context,
              fs: 15,
              fw: FontWeight.w300
          ),
        ),
        SizedBox(height: 20,),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: ColorUtils.WHITE_COLOR,
                    side: BorderSide(
                        width: 1,
                        color: ColorUtils.TEXT_GREY.withValues(alpha: .3)
                    )
                ),
                onPressed: (){},
                icon: SvgPicture.asset(ImageUtils.facebook)),
            IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: ColorUtils.WHITE_COLOR,
                    side: BorderSide(
                        width: 1,
                        color: ColorUtils.TEXT_GREY.withValues(alpha: .3)
                    )
                ),
                onPressed: (){},
                icon: SvgPicture.asset(ImageUtils.google)),
            IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: ColorUtils.WHITE_COLOR,
                    side: BorderSide(
                        width: 1,
                        color: ColorUtils.TEXT_GREY.withValues(alpha: .3)
                    )
                ),
                onPressed: (){},
                icon: SvgPicture.asset(ImageUtils.x)),
          ],
        ),
      ],
    );
  }
}
