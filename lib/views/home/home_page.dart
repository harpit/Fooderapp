import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/category_controller.dart';
import 'package:foodapp/common/Heading.dart';
import 'package:foodapp/common/custom_appbar.dart';
import 'package:foodapp/common/custom_container.dart';
import 'package:foodapp/views/home/all_fastest_food.dart';
import 'package:foodapp/views/home/all_nearby_restaurants.dart';
import 'package:foodapp/views/home/widgets/category_foods_list.dart';
import 'package:foodapp/views/home/widgets/category_list.dart';
import 'package:foodapp/views/home/recommentation.dart';
import 'package:foodapp/views/home/widgets/food_list.dart';
import 'package:foodapp/views/home/widgets/nearby_restaurants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(categoryController());
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
        body: CustomContainer(
            containerContent: Column(
          children: [
            const CategoryList(),
            Obx(() => controller.categoryValue == ''
                ? Column(
                    children: [
                      Heading(
                        text: "Try Something New",
                        onTap: () {
                          Get.to(() => const Recommentation(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 900));
                        },
                      ),
                       foodslist(),
                      Heading(
                        text: "Nearby Restaurants",
                        onTap: () {
                          Get.to(() => const AllNearbyRestaurants(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 900));
                        },
                      ),
                      const Nearbytrestaurants(),
                      Heading(
                        text: "Fastest Food closer to you",
                        onTap: () {
                          Get.to(() => const AllFastestfood(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 900));
                        },
                      ),
                       foodslist(),
                    ],
                  )
                : CustomContainer(
                    containerContent: Column(
                      children: [
                        Heading(
                          more: true,
                          text: "Explore ${controller.titleValue} Category",
                          onTap: () {
                            Get.to(() => const Recommentation(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          },
                        ),
                        const CategoryFoodsList(),
                      ],
                    ),
                  ))
          ],
        )));
  }
}
