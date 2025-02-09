import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/image_utils.dart';
import '../core/utils/string_utils.dart';

class QuickAccessItem extends StatefulWidget {
  const QuickAccessItem({
    required this.btnIcon,
    required this.btnTitle,
    super.key});
  final String btnTitle;
  final String btnIcon;

  @override
  State<QuickAccessItem> createState() => _QuickAccessItemState();
}

class _QuickAccessItemState extends State<QuickAccessItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            style: IconButton.styleFrom(
              backgroundColor: ColorUtils.EASE_WHITE,
              maximumSize: Size(150, 180),
              minimumSize: Size(150, 180),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: (){},
            icon: Column(
              // spacing: 25,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorUtils.WHITE_COLOR,
                    child: SvgPicture.asset(widget.btnIcon),
                  ),
                ),
                Text(widget.btnTitle,
                  style: nunitoSans(
                      context: context,
                      fs: 14
                  ),
                )
              ],
            )),
    );
  }
}

class QuickAccessList extends StatefulWidget {
  const QuickAccessList({
    required this.listData,
    super.key});
  final List<QuickAccessListModel> listData;

  @override
  State<QuickAccessList> createState() => _QuickAccessListState();
}

class _QuickAccessListState extends State<QuickAccessList> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
        itemCount: widget.listData.length + 1, // Add 1 extra item for spacing
        itemBuilder: (context, index) {
          if (index == widget.listData.length) {
            return SizedBox(width: 16); // Extra spacing after the last item
          }
          return QuickAccessItem(
              btnIcon: widget.listData[index].btnIcon,
              btnTitle: widget.listData[index].btnTitle
          );
        });
  }
}

class QuickAccessListModel{
   QuickAccessListModel({
    required this.btnIcon,
    required this.btnTitle,
   });
  final String btnTitle;
  final String btnIcon;
}
List<QuickAccessListModel> quickAccessListData = [
  QuickAccessListModel(
      btnIcon: ImageUtils.bookings,
      btnTitle: "Bookings"),
  QuickAccessListModel(
      btnIcon: ImageUtils.finance,
      btnTitle: "Finance"),
  QuickAccessListModel(
      btnIcon: ImageUtils.message,
      btnTitle: "Messages"),
];