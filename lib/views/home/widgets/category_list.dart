import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/uidata.dart';
import 'package:foodapp/common/shimmers/categories_shimmer.dart';
import 'package:foodapp/hooks/fetch_categories.dart';
import 'package:foodapp/models/categories.dart';
import 'package:foodapp/views/home/widgets/CategoryWidget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading
        ? CatergoriesShimmer()
        : Container(
            height: 80.h,
            margin: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(categoriesList!.length, (i) {
                  CategoriesModel category = categoriesList[i];
                  return CategoryWidget(category: category);
                })),
          );
  }
}
