import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/login_controller.dart';
import 'package:foodapp/common/custom_container.dart';
import 'package:foodapp/models/login_response.dart';
import 'package:foodapp/views/auth/login_redirect.dart';
import 'package:foodapp/views/auth/verification_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final box = GetStorage();
    LoginResponse? user;
    String? token = box.read('token');

    if(token != null){
      user =  controller.getUserInfo();
    }

    if(token == null){
      return LoginRedirect();
    }
    if(user != null && user.verification == false){
      return VerificationPage();
    }
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(preferredSize: Size.fromHeight(130.h), child: Container(height: 130,)),
        body: CustomContainer(containerContent: Container())
    );
  }
}
