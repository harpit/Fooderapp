import 'package:flutter/material.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.first, required this.second});
  final String first;
  final String second;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        Text(first,style: appstyle(kGray, 12, FontWeight.w500),
        ),
        Text(second,style: appstyle(kGray, 12, FontWeight.w500),)

      ]
    );
  }
}
