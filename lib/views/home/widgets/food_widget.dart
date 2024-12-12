import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({super.key, required this.image, required this.title, required this.price, required this.time, this.onTap});

  final String image;
  final String title;
  final String price;
  final String time;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            width: width * .75,
            height: 180.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r), color: kLightWhite),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      height: 112.h,
                      width: width * 0.8,
                      child: Image.network(image, fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                color: kDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$ $price",
                            style: const TextStyle(
                                color: kPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Delivery time",
                            style: TextStyle(
                                color: kGray,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                                color: kDark,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
