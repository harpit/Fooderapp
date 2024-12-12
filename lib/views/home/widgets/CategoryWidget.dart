import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/category_controller.dart';
import 'package:foodapp/models/categories.dart';
import 'package:foodapp/views/Category/all_category.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(categoryController());
    return GestureDetector(
        onTap: () {
          if (controller.categoryValue == category.id) {
            controller.updateCategory = '';
            controller.updatetitle = '';
          } else if (category.value == 'more') {
            Get.to(() => const AllCategories(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900));
          } else {
            controller.updateCategory = category.id;
            controller.updatetitle = category.title;
          }
        },
        child: Obx(
              () => Container(
            margin: EdgeInsets.only(right: 7.w),
            padding: EdgeInsets.only(top: 6.h),
            width: width * 0.19,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color:controller.categoryValue == category.id ?  kSecondary : kOffWhite, width: .5.w)),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Image.network(category.imageUrl, fit: BoxFit.contain),
                ),
                Text(
                  category.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: kDark),
                )
              ],
            ),
          ),
        )

    );
  }
}
