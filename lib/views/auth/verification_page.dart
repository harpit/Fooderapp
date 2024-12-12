import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/verification_controller.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/common/custom_container.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Account Verification", style: appstyle(kGray, 15, FontWeight.w600),),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomContainer(containerContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: height,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Lottie.asset("assets/anime/delivery.json"),
              SizedBox(
                height: 30.h,
              ),
              Text("Please Verify Your Account" ,style: appstyle(kPrimary, 20, FontWeight.w600),),
              SizedBox(
                height: 10.h,
              ),
              Text("Enter 6-digit code sent to your Email" ,textAlign: TextAlign.justify,style: appstyle(kGray, 12, FontWeight.normal),),
              SizedBox(
                height: 5.h,
              ),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                borderColor: kGray,
                focusedBorderColor: kPrimary,
                textStyle: appstyle(kDark, 16, FontWeight.bold),
                borderWidth: 2.0,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here if necessary
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.setCode = verificationCode;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(text: "V E R I F Y  A C C O U N T",
              onTap: () {
                controller.verificationFunction();
              },
                btnHeight: 35.h,
                btnWidth:width,
              ),

            ],
          ),
        ),
      ),color: Colors.white,),
    );
  }
}
