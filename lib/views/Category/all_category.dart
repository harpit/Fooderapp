import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/background_container.dart';
import 'package:foodapp/common/shimmers/foodlist_shimmer.dart';
import 'package:foodapp/hooks/fetch_all_categories.dart';
import 'package:foodapp/models/categories.dart';
import 'package:foodapp/views/Category/Widget/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const Text("Categories",
            style: TextStyle(
                color: kGray, fontWeight: FontWeight.w600, fontSize: 17)),
        centerTitle: true,
      ),
      body: backGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child:isLoading ? const FoodsListShimmer() :  ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(categories!.length, (i) {
                CategoriesModel category = categories[i];
                return CategoryTile(category: category);
              })),
        ),
      ),
    );
  }
}
