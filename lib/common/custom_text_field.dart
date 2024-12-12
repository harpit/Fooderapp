import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, this.keyboardType, this.controller, this.onEditingComplete, this.obscureText, this.suffixIcon, this.validator, this.prefixIcon, this.hintText, this.maxLines});
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget?prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: kGray , width: 0.4),
        borderRadius: BorderRadius.circular(9.r)
      ),
      child: TextFormField(
        maxLines: maxLines?? 1,
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        cursorHeight: 20.h,
        style: appstyle(kDark, 11, FontWeight.normal),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: appstyle(kDark, 13, FontWeight.normal),
          suffixIcon:suffixIcon,
          prefixIcon:prefixIcon
        ),
      ),
    );
  }
}
