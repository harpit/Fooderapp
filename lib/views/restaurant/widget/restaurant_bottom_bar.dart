import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/views/restaurant/rating_page.dart';
import 'package:foodapp/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.widget,
  });

  final RestaurantPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
          color: kSecondaryLight.withOpacity(.4),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            topLeft: Radius.circular(8.r),
          )
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            itemCount: 5,
            itemSize: 30,
            rating : widget.restaurant!.rating.toDouble(),
            itemBuilder : (context, index) =>const Icon(Icons.star,color: Colors.orangeAccent),
          ),
          CustomButton(
            onTap: (){
              Get.to(()=>RatingPage());
            },
            text : "Rate Restaurant",
            btnWidth: width/3,
          )
        ],
      ),
    );
  }
}
