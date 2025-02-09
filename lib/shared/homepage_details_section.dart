import 'package:ease_app/core/utils/image_utils.dart';
import 'package:ease_app/shared/past_bookings_item.dart';
import 'package:ease_app/shared/quick_acess_item.dart';
import 'package:ease_app/view/dashboard/past_bookings_see_all_screen.dart';
import 'package:flutter/material.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/string_utils.dart';

class HomepageDetailsSection extends StatefulWidget {
  const HomepageDetailsSection({super.key});

  @override
  State<HomepageDetailsSection> createState() => _HomepageDetailsSectionState();
}

class _HomepageDetailsSectionState extends State<HomepageDetailsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(context),
        height: screenHeight(context) * .8,
        padding: EdgeInsets.only(left: 0, right: 0, top: 25),
        margin: EdgeInsets.only(top: screenHeight(context) * .06),
        decoration: BoxDecoration(
            color: ColorUtils.WHITE_COLOR,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(25)
            )
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringUtils.quickAccess,
                    style: nunitoSans(
                        context: context,
                        fs: 18,
                        fw: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth(context),
                height: 180,
                // color: Colors.teal,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: QuickAccessList(listData: quickAccessListData),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringUtils.pastBookings,
                      style: nunitoSans(
                          context: context,
                        fs: 16,
                        fw: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: (){
                          Navigator.of(context).pushNamed(PastBookingsSeeAllScreen.routeName);
                        },
                        child: Text(StringUtils.seeAll,
                        style: nunitoSans(
                            context: context,
                            fs: 13,
                            fw: FontWeight.normal
                        ),
                      ),),
                    )
                  ],
                ),
              ),
              PastBookingsList(PBLModel: pastBookingsListData),
            ],
          ),
        ),
      );
  }
}
