import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key,
      this.onEditingComplete,
      this.keyboardType,
      this.initialValue,
      this.controller,
      this.hintText,
      this.prefixIcon});

  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      onEditingComplete: onEditingComplete,
      textInputAction: TextInputAction.next,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Valid Data";
        } else {
          return null;
        }
      },
      style: appstyle(kDark, 12, FontWeight.normal),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: EdgeInsets.all(6.h),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRed, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimary, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRed, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGray, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimary, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimary , width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))
        ),
      ),
    );
  }
}
