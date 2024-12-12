import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/common/custom_container.dart';
import 'package:foodapp/views/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomContainer(containerContent: Column(
          children: [
            Container(
              color: Colors.white,
              child: LottieBuilder.asset(
                "assets/anime/delivery.json",
                width: width,
                height: height/2,
              ),
            ),
            CustomButton(text: "L O G I N",
            onTap: () {
              Get.to(()=> LoginPage(),
              transition: Transition.cupertino,
              duration: Duration(milliseconds: 900));
            },
              btnHeight: 40.h,
            btnWidth:width-20 ,)
          ],
        )),
      ),
    );
  }
}
