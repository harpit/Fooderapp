import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/shimmers/foodlist_shimmer.dart';
import 'package:foodapp/hooks/fetch_foods.dart';
import 'package:foodapp/hooks/foods_by_restaurants.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/home/widgets/food_tile.dart';

class ExploreWidget extends HookWidget {
  const ExploreWidget({super.key ,required this.code});
  final String code;
  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods(code);
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kLightWhite,
      body:isLoading ? const FoodsListShimmer() : SizedBox(
          height: height * 0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            children: List.generate(foods!.length, (index) {
              final FoodsModel food = foods[index];
              return FoodTile(food: food);
            }),
          )
      ),
    );
  }
}
