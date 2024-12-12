import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/category_controller.dart';
import 'package:foodapp/models/categories.dart';
import 'package:foodapp/views/Category/category_page.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(categoryController());
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updatetitle = category.title;
        Get.to(() => CategoryPage(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 900)
        );
      },
      leading: CircleAvatar(
        radius: 17.r,
        backgroundColor: kGrayLight,
        child: Image.network(category.imageUrl , fit: BoxFit.contain),
      ),
      title : Text(
        category.title,
        style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: kGray),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded , color: kGray , size: 15.r),
    );
  }
}
