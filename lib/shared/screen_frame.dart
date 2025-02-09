import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class ScreenFrame extends StatefulWidget {
  final Widget? leading;
  final String? appbarTitle;
  final List<Widget>? actions;
  final Widget child;
  final String? buttonTitle;
  final String? bottomText1;
  final Color? bottomText1Color;
  final Color? bottomText2Color;
  final String? bottomText2;
  final FontWeight? bottomText1FontWeight;
  final FontWeight? bottomText2FontWeight;
  final Function()? buttonAction;
  final Function()? bottomText1Action;
  final Function()? bottomText2Action;
  final bool? hasAppbar;
  final bool? showProgress;
  const ScreenFrame({Key? key,
    this.leading,
    this.appbarTitle,
    this.actions,
    required this.child,
    this.buttonTitle,
    this.bottomText1FontWeight,
    this.bottomText2FontWeight,
    this.buttonAction,
    this.bottomText1Action,
    this.bottomText2Action,
    this.bottomText1,
    this.bottomText2,
    this.bottomText1Color,
    this.bottomText2Color,
    this.hasAppbar,
    this.showProgress,
  }) : super(key: key);

  @override
  State<ScreenFrame> createState() => _ScreenFrameState();
}

class _ScreenFrameState extends State<ScreenFrame> {
  late SystemUiOverlayStyle _previousStyle;

  @override
  void initState() {
    super.initState();

    // Save the current status bar style before changing it
    _previousStyle = SystemUiOverlayStyle.light; // Adjust based on your default

    // Set the new status bar style for this screen
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // Change icons
    ));
  }

  @override
  void dispose() {
    // Restore the previous status bar style when leaving the screen
    SystemChrome.setSystemUIOverlayStyle(_previousStyle);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal,
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        child: Stack(
          children: [
            Container(
              width: screenWidth(context),
              height: screenHeight(context),
              child: Image.asset(ImageUtils.bg,
                fit: BoxFit.cover,
              ),
            ),
            widget.child,
          ],
        ),
      ),
    );
    // return Placeholder();
    // return Scaffold(
    //   appBar: widget.hasAppbar??false ? AppBar(
    //     scrolledUnderElevation: 0,
    //     leading: widget.leading,
    //     title: Text(widget.appbarTitle ?? '',
    //       style: TextStyle(fontWeight: FontWeight.w500),
    //     ),
    //     centerTitle: true,
    //     actions: widget.actions,
    //   ): null,
    //   body: widget.showProgress??false ? Center(
    //    child: CircularProgressIndicator(
    //      backgroundColor: ColorUtils.LITE_PRIMARY,
    //      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
    //    ),
    //   ):Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       Flexible(
    //         flex: 1,
    //         child: SingleChildScrollView(
    //           child: Container(
    //             width: MediaQuery.of(context).size.width,
    //             height: MediaQuery.of(context).size.height*.7,
    //             child: widget.child,
    //           ),
    //         ),
    //       ),
    //
    //       Padding(
    //         padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16.0),
    //         child: RichText(
    //             textAlign: TextAlign.center,
    //             text: TextSpan(
    //                 children: [
    //                   TextSpan(
    //                     text: widget.bottomText1,
    //                     recognizer: TapGestureRecognizer()
    //                       ..onTap = widget.bottomText1Action,
    //                     style: TextStyle(
    //                         color: widget.bottomText1Color,
    //                         fontWeight: widget.bottomText1FontWeight
    //                     ),
    //                   ),
    //                   TextSpan(
    //                       text: widget.bottomText2,
    //                       recognizer: TapGestureRecognizer()
    //                         ..onTap = widget.bottomText2Action,
    //                       style: TextStyle(
    //                           color: widget.bottomText2Color,
    //                           fontWeight: widget.bottomText1FontWeight
    //                       )
    //                   ),
    //                 ]
    //             )),
    //       ),
    //       Container(
    //         width: MediaQuery.of(context).size.width,
    //         height: 70,
    //         color: Theme.of(context).primaryColor,
    //         child: Padding(
    //           padding: const EdgeInsets.only(bottom: 20.0),
    //           child: CustomReusableButton(
    //             buttonTitle: widget.buttonTitle,
    //             function: widget.buttonAction,
    //             buttonColor: ColorUtils.TRANSPARENT,
    //             borderColor: ColorUtils.TRANSPARENT,
    //             fontSize: 18,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    //   resizeToAvoidBottomInset: true,
    // );
  }
}
