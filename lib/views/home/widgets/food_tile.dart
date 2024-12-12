import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/food/food_page.dart';
import 'package:get/get.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, this.color});

  final FoodsModel food;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> FoodPage(food : food));
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r), color:color??kOffWhite),
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
                          child: Image.network(food.imageUrl[0],
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
                                  Icon(Icons.star, color: kSecondary),
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
                        food.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: kDark),
                      ),
                      Text(
                        "Delivery Time : ${food.time}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: kGray),
                      ),
                      SizedBox(
                          width: width * 0.7,
                          height: 18.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              Additive additive = food.additives[i];
                              return Container(
                                margin: EdgeInsets.only(right: 5.w),
                                decoration: BoxDecoration(
                                    color: kSecondaryLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.r),),
                                ),
                                child: Center(
                                  child: Padding(padding: EdgeInsets.all(2.h),
                                  child: Text(additive.title,style: appstyle(kGray, 11, FontWeight.w600)),
                                  ),
                                ),
                              );
                            },
                            itemCount: food.additives.length,
                          )),
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
                color: kPrimary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text("\$ ${food.price.toStringAsFixed(2)}",
                    style: appstyle(kLightWhite, 13, FontWeight.bold)),
              ),
            ),
          ),
          Positioned(
            right: 75.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 20.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(MaterialCommunityIcons.cart_plus,
                      size: 15.h, color: kLightWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
