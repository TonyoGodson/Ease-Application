
import 'package:ease_app/model_view/auth_view_model.dart';
import 'package:ease_app/view/dashboard/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/image_utils.dart';
import '../view/dashboard/home_screen.dart';

class NavScreen extends StatefulWidget {
  static const String routeName = "nav_screen";
  const NavScreen({
    this.screenNumber,
    Key? key}) : super(key: key);
  final int? screenNumber;
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 0;
  String? _profileName;
  List<Widget> screens = [
    HomePage(),
    const Scaffold(
      body: Center(child: Text("Saved Screen"),),
    ),
    const Scaffold(
      body: Center(child: Text("Bookings Screen"),),
    ),
    ProfileScreen()
  ];
  @override
  void initState(){
    super.initState();
    currentIndex = widget.screenNumber!;
    _fetchProfileName();
  }
  void _fetchProfileName() async {
    String? name = await context.read<AuthViewModel>().profileName();
    if (mounted) {
      setState(() {
        _profileName = name ?? "No Name";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.LIGHTER_FIELD_COLOR,
      body: screens[currentIndex],
      bottomNavigationBar: bottomNavi(),
    );
  }

  Widget bottomNavi(){
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        padding: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
            color: ColorUtils.WHITE_COLOR,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0)
            ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 5,
              spreadRadius: 1,
              color: ColorUtils.BORDER_COLOR
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      ),
                      Icon(CupertinoIcons.home,
                        color: currentIndex == 0 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                      ),
                      Text("Home",
                        style: specialText(
                          b: true,
                            context: context,
                          c: currentIndex == 0 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      ),
                      Icon(Icons.favorite_border_outlined,
                        color: currentIndex == 1 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                      ),
                      Text("Bookings",
                        style: specialText(
                          b: true,
                          context: context,
                          c: currentIndex == 1 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      ),
                      Icon(CupertinoIcons.briefcase,
                        color: currentIndex == 2 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                      ),
                      Text("Bookings",
                        style: specialText(
                          b: true,
                          context: context,
                          c: currentIndex == 2 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      ),
                      Stack(
                        children: [
                          Icon(Icons.account_circle_outlined,
                            color: currentIndex == 3 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withOpacity(.65),
                        ),]
                      ),
                      Text(_profileName??"",
                        style: specialText(
                          b: true,
                          context: context,
                          c: currentIndex == 3 ?  ColorUtils.EASE_BLUE: ColorUtils.TEXT_GREY.withValues(alpha: .65),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}