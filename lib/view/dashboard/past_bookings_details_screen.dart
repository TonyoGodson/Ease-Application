import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/shared/past_bookings_item.dart';
import 'package:flutter/material.dart';

class PastBookingsDetailsScreen extends StatefulWidget {
  static const String routeName = "past_bookings_details_screen";
  const PastBookingsDetailsScreen({
    required this.pastBookingsListModel,
    super.key});
  final PastBookingsListModel pastBookingsListModel;

  @override
  State<PastBookingsDetailsScreen> createState() => _PastBookingsDetailsScreenState();
}

class _PastBookingsDetailsScreenState extends State<PastBookingsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(height: 30,),
          Container(
              width: screenWidth(context),
              child: Image.asset(widget.pastBookingsListModel.image,
                fit: BoxFit.cover,
              )),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.pastBookingsListModel.title,
                style: nunitoSans(
                  c: ColorUtils.BLACK_COLOR,
                  context: context,
                  fs: 18,
                  fw: FontWeight.bold
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.pastBookingsListModel.address,
                style: nunitoSans(
                  c: ColorUtils.TEXT_GREY,
                  context: context,
                  fs: 14,
                  fw: FontWeight.normal
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.pastBookingsListModel.price,
                style: nunitoSans(
                  c: ColorUtils.TEXT_GREY,
                  context: context,
                  fs: 14,
                  fw: FontWeight.normal
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
