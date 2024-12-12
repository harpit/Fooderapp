import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/Reusebletext.dart';
import 'package:foodapp/common/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.btnWidth,
      this.btnHeight,
      this.btnColor,
      this.radius,
      required this.text});

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btnColor;
  final double? radius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: btnWidth ?? width,
          height: btnHeight ?? 30.h,
          decoration: BoxDecoration(
            color: btnColor ?? kPrimary,
            borderRadius: BorderRadius.circular(radius ?? 9.r),
          ),
          child: Center(
              child: Text(text  , style: TextStyle(color: kLightWhite , fontWeight: FontWeight.w500 , fontSize: 14),)),
        ));
  }
}
