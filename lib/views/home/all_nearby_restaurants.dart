import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/background_container.dart';
import 'package:foodapp/common/shimmers/foodlist_shimmer.dart';
import 'package:foodapp/hooks/fetch_all_restaurants.dart';
import 'package:foodapp/models/restaurants_model.dart';
import 'package:foodapp/views/home/widgets/restaurant_tile.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("65da079bc3aca7f84619f059");
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
        backgroundColor: kSecondaryLight,
        appBar: AppBar(
          backgroundColor: kSecondaryLight,
          elevation: 0,
          title: const Text("Nearby Restaurants",
              style: TextStyle(
                  fontSize: 19, color: kDark, fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: backGroundContainer(
          color: Colors.white,
          child:isLoading ? FoodsListShimmer() : Padding(
            padding: EdgeInsets.all(12.h),
            child: ListView(
                children: List.generate(restaurants!.length, (i) {
              RestaurantsModel restaurant = restaurants[i];
              return RestaurantTile(restaurant: restaurant);
            })),
          ),
        ));
  }
}
