import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/shared/botton_nav.dart';
import 'package:ease_app/shared/screen_frame.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:ease_app/view/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/helper.dart';
import '../../../core/utils/string_utils.dart';
import '../../../services/api_handler.dart';
import '../../../shared/customReusableButton.dart';
import '../../../shared/custom_reusable_textfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _firstnameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
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
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Scaffold(
        backgroundColor: ColorUtils.TRANSPARENT_,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 70,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(StringUtils.signup,
                                style: nunitoSans(
                                  context: context,
                                  fs: 20,
                                  fw: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(StringUtils.fname,
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
                                      controller: _firstnameController,
                                      focusNode: _firstnameFocusNode,
                                      label: "Marvelous",
                                      hint: "Marvelous",
                                      leftMargin: 18,
                                      borderRadius: 10,
                                      maxLength: 45,
                                      fontSize: 15,
                                      borderColor: ColorUtils.TRANSPARENT_,
                                      filled: true,
                                      fillColor: ColorUtils.WHITE_COLOR,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value){
                                        onChangeFocusNode(context, _firstnameFocusNode, _lastnameFocusNode);
                                      },
                                      validator: (value) => firstNameValidator(value),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(width: 15,),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(StringUtils.lname,
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
                                      controller: _lastnameController,
                                      focusNode: _lastnameFocusNode,
                                      label: "Oliver",
                                      hint: "Oliver",
                                      rightMargin: 18,
                                      borderRadius: 10,
                                      maxLength: 45,
                                      fontSize: 15,
                                      borderColor: ColorUtils.TRANSPARENT_,
                                      filled: true,
                                      fillColor: ColorUtils.WHITE_COLOR,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value){
                                        onChangeFocusNode(context, _lastnameFocusNode, _emailFocusNode);
                                      },
                                      validator: (value) => lastNameValidator(value),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
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
                              onChangeFocusNode(context, _emailFocusNode, _phoneNumberFocusNode);
                            },
                            validator: (value) => emailValidator(value),
                            onChange: (value){
                              setState(() {
                                emailValidator(value);
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(StringUtils.phoneN,
                                style: nunitoSans(
                                    context: context,
                                    fs: 14,
                                    ht: 2.0,
                                    fw: FontWeight.w300
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomReusableTextField(
                                  controller: _phoneNumberController,
                                  focusNode: _phoneNumberFocusNode,
                                  label: "81-234-56789",
                                  hint: "81-234-56789",
                                  leftMargin: 18,
                                  rightMargin: 18,
                                  borderRadius: 10,
                                  maxLength: 13,
                                  fontSize: 15,
                                  borderColor: ColorUtils.TRANSPARENT_,
                                  filled: true,
                                  fillColor: ColorUtils.WHITE_COLOR,
                                  keyboardType: TextInputType.phone,
                                  prefIcon: Container(
                                    width: 65,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color: ColorUtils.EASE_BLUE
                                        )
                                      )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(ImageUtils.flag),
                                        Text(" +234")
                                      ],
                                    ),
                                  ),
                                  onFieldSubmitted: (value){
                                    onChangeFocusNode(context, _phoneNumberFocusNode, _passwordFocusNode);
                                  },
                                  validator: (value) => phoneNumberValidator(value),
                                ),
                              ),
                            ],
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
                          SizedBox(height: 50,),
                          CustomReusableButton(
                              buttonTitle: "Sign Up",
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
                              Text(StringUtils.alreadyhave,
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
                          SocialBtns(login: false,),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
  _submit(BuildContext context) async {
    if(formKey.currentState!.validate()){
      Map<String, dynamic> data = {
        "fullName": _firstnameController.text.trim()+" "+_lastnameController.text.trim(),
        "email": _emailController.text.trim(),
        "phoneNumber": "+234"+_phoneNumberController.text.trim(),
        "password": _passwordController.text.trim(),
      };
      bool done = await ApiHandler.signUpToApp(context, data);
      if(done){
        _firstnameController.clear();
        _lastnameController.clear();
        _emailController.clear();
        _phoneNumberController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        // Navigator.of(context).pushNamed(NavScreen.routeName,
        //   arguments: 0
        // );
      }
    }
  }
}
