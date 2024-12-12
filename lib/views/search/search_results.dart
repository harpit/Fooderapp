import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/search_controller.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/home/widgets/food_tile.dart';
import 'package:get/get.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding:  EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, index) {
          FoodsModel food = controller.searchResults![index];
          return FoodTile(food: food);
        },
      ),
    );
  }
}
