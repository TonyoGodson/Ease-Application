import 'package:flutter/material.dart';

import '../core/utils/color_utils.dart';

class ReusableAppBar extends StatefulWidget implements PreferredSizeWidget{
  const ReusableAppBar({
    this.title,
    this.action,
    this.actionIcons,
    this.leadingIcon,
    this.appBarBackgroundColor,
    this.backBtn,
    this.centerTitle,
    Key? key
  }) : super(key: key);
  final Widget? title;
  final List<Widget>? actionIcons;
  final Widget? leadingIcon;
  final Color? appBarBackgroundColor;
  final bool? backBtn;
  final bool? centerTitle;
  final Function()? action;
  @override
  State<ReusableAppBar> createState() => _ReusableAppBarState();

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  // Size get preferredSize => Size.fromHeight(100.0);
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ReusableAppBarState extends State<ReusableAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.appBarBackgroundColor??ColorUtils.TRANSPARENT_,
      leading: widget.backBtn??true ? IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon:  Icon(
          Icons.arrow_back_ios_new,
          size: 14,
          color: ColorUtils.WHITE_COLOR,
        ),
      ): widget.leadingIcon,
      title: widget.title,
      centerTitle: widget.centerTitle,
      actions: widget.actionIcons
      /*[
        IconButton(
          icon: Icon(widget.icon??null, color: ColorUtils.WHITE_COLOR),
          onPressed: widget.action
        )
      ]*/,
    );
  }
}
