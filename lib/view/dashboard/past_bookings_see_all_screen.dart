import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/core/utils/string_utils.dart';
import 'package:ease_app/shared/past_bookings_item.dart';
import 'package:flutter/material.dart';

class PastBookingsSeeAllScreen extends StatefulWidget {
  static const String routeName = "past_bookings_see_all_screen";
  const PastBookingsSeeAllScreen({super.key});

  @override
  State<PastBookingsSeeAllScreen> createState() => _PastBookingsSeeAllScreenState();
}

class _PastBookingsSeeAllScreenState extends State<PastBookingsSeeAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtils.pastBookings,
          style: nunitoSans(
            context: context,
            fs: 16,
            fw: FontWeight.bold
          ),
        ),
      ),
      body: PastBookingsList(
        scrollable: true,
          PBLModel: pastBookingsListData),
    );
  }
}
