import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/password_controller.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key, this.controller,
        });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(() => TextFormField(
      cursorColor: kDark,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      controller: controller,
      obscureText: passwordController.password,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Valid Password";
        } else {
          return null;
        }
      },
      style: appstyle(kDark, 12, FontWeight.normal),
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Icon(
          CupertinoIcons.lock_circle,
          size: 26,
          color: kGray,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            passwordController.setPassword = !passwordController.password;
          },
          child: Icon(
           passwordController.password ? Icons.visibility : Icons.visibility_off,
            size: 26,
            color: kGray,
          ),
        ),
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
    ));
  }
}
