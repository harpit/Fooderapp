import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/shimmers/foodlist_shimmer.dart';
import 'package:foodapp/hooks/foods_by_restaurants.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/home/widgets/food_tile.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({super.key ,required this.restaurantId});
  final String restaurantId;
  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchrestaurantsFoods(restaurantId);
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kLightWhite,
      body:isLoading ?const FoodsListShimmer() : Container(
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
