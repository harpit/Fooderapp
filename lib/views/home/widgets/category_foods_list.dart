import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/shimmers/foodlist_shimmer.dart';
import 'package:foodapp/hooks/fetch_category_foods.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/home/widgets/food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const FoodsListShimmer()
          : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                  children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodTile(color: Colors.white, food: food);
              })),
            ),
    );
  }
}
