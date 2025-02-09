import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/core/utils/string_utils.dart';
import 'package:ease_app/shared/customReusableButton.dart';
import 'package:ease_app/shared/homepage_details_section.dart';
import 'package:ease_app/shared/quick_acess_item.dart';
import 'package:ease_app/shared/reusable_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // final  ValueNotifier<bool> _hideBalance = ValueNotifier<bool >(false);
  bool _hideBalance = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.EASE_BLUE,
      appBar: ReusableAppBar(
        backBtn: false,
        appBarBackgroundColor: ColorUtils.EASE_BLUE,
        leadingIcon: IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(ImageUtils.menu_left)),
        title: SizedBox(
          width: screenWidth(context) * .3,
            child: Image.asset(ImageUtils.ease_logo2)),
        centerTitle: true,
        actionIcons: [
          IconButton(onPressed: (){},
              icon: Icon(
                  HeroiconsOutline.bell,
                  color: ColorUtils.WHITE_COLOR,
          ))
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight(context) * .02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text("Total Earning",
                    style: nunitoSans(
                      c: ColorUtils.WHITE_COLOR,
                        context: context,
                      fs: 12,
                      fw: FontWeight.normal,
                      ht: 1.0
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){
                        setState(() {
                          _hideBalance = !_hideBalance;
                        });
                      },
                      icon: Icon(_hideBalance ?
                        Icons.visibility_off_outlined:Icons.visibility_outlined,
                        color: ColorUtils.WHITE_COLOR,
                       size: 12,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(_hideBalance ? StringUtils.balanceValue : StringUtils.hiddenText,
                style: nunitoSans(
                  c: ColorUtils.WHITE_COLOR,
                    context: context,
                  fs: 35,
                  fw: FontWeight.bold,
                  ht: 1.0
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomReusableButton(
                  buttonTitle: "Withdraw",
                  titleColor: ColorUtils.BLACK_COLOR,
                  fontSize: 13,
                  buttonColor: ColorUtils.WHITE_COLOR,
                  buttonHeight: 35,
                  buttonWidth: screenWidth(context) * .25,
                  borderRadius: 20,
                  left: 0, right: 0,
                  function: (){}),
            ),
            HomepageDetailsSection()
          ],
        ),
      ),
    );
  }
}
