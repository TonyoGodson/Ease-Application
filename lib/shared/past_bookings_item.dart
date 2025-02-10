import 'package:ease_app/view/dashboard/past_bookings_details_screen.dart';
import 'package:flutter/material.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/image_utils.dart';
import '../core/utils/string_utils.dart';

class PastBookingsItem extends StatefulWidget {
  PastBookingsItem({
    required this.image,
    required this.title,
    required this.address,
    required this.date,
    required this.nights,
    required this.price,
    this.freeB, this.freeC,
    required this.index,
    super.key});
  final String image;
  final String title;
  final String address;
  final String date;
  final String nights;
  final String price;
  bool? freeB;
  bool? freeC;
  final int index;

  @override
  State<PastBookingsItem> createState() => _PastBookingsItemState();
}

class _PastBookingsItemState extends State<PastBookingsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(PastBookingsDetailsScreen.routeName,
            arguments: pastBookingsListData[widget.index]);
      },
      child: Container(
            width: screenWidth(context),
            margin: EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: ColorUtils.BORDER_COLOR.withValues(alpha: .25)
                  )
                ]
            ),
            child: Stack(
              children: [
                Container(
                  width: screenWidth(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                      child: Image.asset(widget.image,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 0,
                  left: 0, right: 0,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: ColorUtils.WHITE_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15)
                              )
                          )
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed(PastBookingsDetailsScreen.routeName,
                        arguments: pastBookingsListData[widget.index]);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(widget.title,
                                style: nunitoSans(
                                    c: ColorUtils.EASE_BLUE,
                                    context: context,
                                    fs: 14,
                                    fw: FontWeight.bold
                                ),
                              ),
                              Text(StringUtils.dot,
                                style: nunitoSans(
                                    c: ColorUtils.BORDER_COLOR,
                                    context: context,
                                    fs: 14,
                                    fw: FontWeight.bold
                                ),
                              ),
                              Text(widget.address,
                                style: nunitoSans(
                                    c: ColorUtils.GREEN_COLOR,
                                    context: context,
                                    fs: 9,
                                    fw: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(widget.date,
                                style: nunitoSans(
                                    c: ColorUtils.TEXT_GREY,
                                    context: context,
                                    fs: 9,
                                    ht: 2.5,
                                    fw: FontWeight.w400
                                ),
                              ),
                              Text(widget.nights,
                                style: nunitoSans(
                                    c: ColorUtils.BLACK_COLOR,
                                    context: context,
                                    fs: 10,
                                    fw: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                          widget.freeB??true ?Row(
                            children: [
                              Icon(Icons.check,
                                size: 14,
                                color: ColorUtils.GREEN_COLOR,
                              ),
                              SizedBox(width: 5,),
                              Text(StringUtils.freeB,
                                style: nunitoSans(
                                    c: ColorUtils.GREEN_COLOR,
                                    context: context,
                                    fs: 9,
                                    ht: 2.5,
                                    fw: FontWeight.w400
                                ),
                              ),
                            ],
                          ):SizedBox.shrink(),
                          widget.freeC??true ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.check,
                                      size: 14,
                                      color: ColorUtils.GREEN_COLOR,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(StringUtils.freeC,
                                      style: nunitoSans(
                                          c: ColorUtils.GREEN_COLOR,
                                          context: context,
                                          fs: 9,
                                          ht: 1.0,
                                          fw: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(widget.price,
                                style: nunitoSans(
                                    c: ColorUtils.BLACK_COLOR,
                                    context: context,
                                    fs: 11,
                                    fw: FontWeight.w700
                                ),
                              ),
                            ],
                          ):SizedBox.shrink(),
                        ],
                      )),
                )
              ],
            )
        ),
    );
  }
}



























class PastBookingsListModel{
  PastBookingsListModel({
    required this.image,
    required this.title,
    required this.address,
    required this.date,
    required this.nights,
    required this.price,
    this.freeB, this.freeC,
 });
  final String image;
  final String title;
  final String address;
  final String date;
  final String nights;
  final String price;
  bool? freeB;
  bool? freeC;
}

List<PastBookingsListModel> pastBookingsListData = [
  PastBookingsListModel(
      image: ImageUtils.frame,
      title: StringUtils.laxadHotel,
      address: StringUtils.address,
      date: StringUtils.date,
      nights: StringUtils.nights,
      price: StringUtils.price,
    freeB: true,
    freeC: true
  ),
  PastBookingsListModel(
      image: ImageUtils.eko,
      title: StringUtils.ekoHotel,
      address: StringUtils.address2,
      date: StringUtils.date,
      nights: StringUtils.nights,
      price: StringUtils.price2,
    freeB: true,
    freeC: true
  ),
  PastBookingsListModel(
      image: ImageUtils.oriental,
      title: StringUtils.orientalHotel,
      address: StringUtils.address3,
      date: StringUtils.date,
      nights: StringUtils.nights,
      price: StringUtils.price3,
    freeB: true,
    freeC: true
  ),
  PastBookingsListModel(
      image: ImageUtils.frame,
      title: StringUtils.laxadHotel,
      address: StringUtils.address,
      date: StringUtils.date,
      nights: StringUtils.nights,
      price: StringUtils.price,
    freeB: true,
    freeC: true
  ),
  PastBookingsListModel(
      image: ImageUtils.eko,
      title: StringUtils.ekoHotel,
      address: StringUtils.address2,
      date: StringUtils.date,
      nights: StringUtils.nights,
      price: StringUtils.price2,
    freeB: true,
    freeC: true
  ),
  PastBookingsListModel(
      image: ImageUtils.oriental,
      title: StringUtils.orientalHotel,
      address: StringUtils.address3,
      date: StringUtils.date,
      nights: StringUtils.nights,
      price: StringUtils.price3,
    freeB: true,
    freeC: true
  ),
];





































class PastBookingsList extends StatefulWidget {
  const PastBookingsList({
    required this.PBLModel,
    this.scrollable,
    super.key});
  final bool? scrollable;
  final List<PastBookingsListModel> PBLModel;
  @override
  State<PastBookingsList> createState() => _PastBookingsListState();
}

class _PastBookingsListState extends State<PastBookingsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: widget.scrollable??false
          ? AlwaysScrollableScrollPhysics()
          : NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18),
      itemCount: widget.PBLModel.length,
        itemBuilder: (context, index){
          return PastBookingsItem(
              image: widget.PBLModel[index].image,
              title: widget.PBLModel[index].title,
              address: widget.PBLModel[index].address,
              date: widget.PBLModel[index].date,
              nights: widget.PBLModel[index].nights,
              price: widget.PBLModel[index].price,
            freeB: widget.PBLModel[index].freeB,
            freeC: widget.PBLModel[index].freeC,
            index: index,
          );
        });
  }
}

