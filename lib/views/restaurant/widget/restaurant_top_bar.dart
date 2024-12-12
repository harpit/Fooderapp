import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/views/restaurant/direction_page.dart';
import 'package:foodapp/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class RestaurantTopBar extends StatelessWidget {
  const RestaurantTopBar({
    super.key,
    required this.widget,
  });

  final RestaurantPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon:const Icon(Ionicons.chevron_back_circle,
                  size: 28, color: kLightWhite)),
          Text(widget.restaurant!.title,style: appstyle(kDark, 15, FontWeight.w700),),
          IconButton(
              onPressed: () {
                Get.to(()=>const DirectionsPage());
              },
              icon:const Icon(Ionicons.location,
                  size: 27, color: kLightWhite))
        ],
      ),
    );
  }
}
