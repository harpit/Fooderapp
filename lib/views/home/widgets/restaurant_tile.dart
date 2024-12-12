import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/models/restaurants_model.dart';
import 'package:foodapp/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class RestaurantTile extends StatelessWidget {
   RestaurantTile({super.key, required this.restaurant});

  final RestaurantsModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>RestaurantPage(restaurant: restaurant));
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r), color: kOffWhite),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: Image.network(restaurant.imageUrl,
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                            color: kGray.withOpacity(0.6),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemBuilder: (context, i) =>
                                  const Icon(Icons.star, color: kSecondary),
                              itemSize: 15.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: kDark),
                      ),
                      Text(
                        "Delivery Time : ${restaurant.time}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: kGray),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          restaurant.coords.address,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: kGray),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 5.w,
              top: 6.h,
              child: Container(
                width: 60.w,
                height: 24.h,
                decoration: BoxDecoration(
                    color: restaurant.isAvailable == true ||
                        restaurant.isAvailable == null
                        ? kPrimary
                        : kSecondaryLight,
                    borderRadius: BorderRadius.circular(10.r),
                ),
                 child: Center(
                   child: Text(restaurant.isAvailable == true ||
                     restaurant.isAvailable == null ? "Open" : "Close",
                       style: appstyle(kLightWhite, 13, FontWeight.w600)),
                 ),
              ),
          ),
        ],
      ),
    );
  }
}
