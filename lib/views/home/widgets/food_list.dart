import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/Constants/uidata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/common/shimmers/nearby_shimmer.dart';
import 'package:foodapp/hooks/fetch_foods.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/food/food_page.dart';
import 'package:foodapp/views/home/widgets/food_widget.dart';
import 'package:get/get.dart';

class foodslist extends HookWidget {
  const foodslist({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 184.h,
      margin: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                    onTap: () {
                      Get.to(() => FoodPage(food: food));
                    },
                    image: food.imageUrl[0],
                    title: food.title,
                    price: food.price.toStringAsFixed(2),
                    time: food.time);
              })),
    );
  }
}
