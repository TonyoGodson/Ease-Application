import 'package:ease_app/core/utils/constants.dart';
import 'package:ease_app/model_view/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/color_utils.dart';
import '../data/shared_preferences.dart';

class ReusableCheckBox extends StatefulWidget {
  const ReusableCheckBox({
    required this.checked,
    this.circle,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundUncheckColor,
    this.uncheckColor,
    this.borderColor,
    this.borderCheckColor,
    this.borderUncheckColor,
    this.checkColor,
    // required this.action,
    Key? key}) : super(key: key);
  final bool checked;
  final bool? circle;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? backgroundUncheckColor;
  final Color? uncheckColor;
  final Color? borderColor;
  final Color? borderCheckColor;
  final Color? borderUncheckColor;
  final Color? checkColor;
  // final Function() action;
  @override
  State<ReusableCheckBox> createState() => _ReusableCheckBoxState();
}

class _ReusableCheckBoxState extends State<ReusableCheckBox> {
  SharedPrefService sharedPrefService = SharedPrefService();
  bool check = false;
  @override
  void initState(){
    super.initState();
    // check = widget.checked;
    check = context.read<AuthViewModel>().rememberMe??false;
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(15, 15),
            minimumSize: const Size(15, 15),
            padding: EdgeInsets.all(0),
            backgroundColor: context.read<AuthViewModel>().rememberMe??false
                ? (widget.backgroundColor ?? Theme.of(context).primaryColor)
                :(widget.backgroundUncheckColor??ColorUtils.TRANSPARENT_),
            shape: widget.circle??true? CircleBorder(
                side: BorderSide(
                    width: 1,
                    color: context.read<AuthViewModel>().rememberMe??false
                        ? (widget.borderCheckColor??Theme.of(context).primaryColor)
                        :(widget.borderUncheckColor??ColorUtils.BORDER_COLOR)
                )
            ):RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius??0),
                side: BorderSide(
                    width: 1,
                    color: context.read<AuthViewModel>().rememberMe??false
                        ? (widget.borderCheckColor??Theme.of(context).primaryColor)
                        :(widget.borderUncheckColor??ColorUtils.BORDER_COLOR)
                )
            )
        ),
        onPressed: (){
          setState(() {
            check = !check;
            // context.read<AuthViewModel>().rememberMe = check;
            sharedPrefService.writeRememberMe(
                context,
                Constants.REMEMBER_ME,
                check);
          });
        },
        icon: Icon(Icons.check,
          size: 10,
          color: context.read<AuthViewModel>().rememberMe??false
              ? (widget.checkColor??ColorUtils.WHITE_COLOR)
              :(widget.uncheckColor??ColorUtils.TRANSPARENT_),
        ));
  }
}