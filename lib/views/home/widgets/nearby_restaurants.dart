import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/Constants/uidata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/common/shimmers/nearby_shimmer.dart';
import 'package:foodapp/hooks/fetch_restaurants.dart';
import 'package:foodapp/models/restaurants_model.dart';
import 'package:foodapp/views/home/widgets/restaurants_widget.dart';
import 'package:foodapp/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class Nearbytrestaurants extends HookWidget {
  const Nearbytrestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return isLoading
        ? NearbyShimmer()
        : Container(
            height: 190.h,
            margin: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(restaurants!.length, (i) {
                  RestaurantsModel restaurant = restaurants[i];
                  return restaurantsWidget(
                    onTap: (){
                      Get.to(()=> RestaurantPage(restaurant: restaurant));
                    },
                      image: restaurant.imageUrl,
                      logo: restaurant.logoUrl,
                      title: restaurant.title,
                      time: restaurant.time,
                      rating: restaurant.ratingCount);
                })),
          );
  }
}
