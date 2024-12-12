import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/login_controller.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/common/background_container.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/models/login_model.dart';
import 'package:foodapp/views/auth/registration_page.dart';
import 'package:foodapp/views/auth/widget/email_textfield.dart';
import 'package:foodapp/views/auth/widget/password_textfield.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Text("Fooders Family" , style: appstyle(kDark, 17, FontWeight.w600),),
        centerTitle: true,
      ),
      body: backGroundContainer(
        color: kOffWhite,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),topRight: Radius.circular(30.r)),
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height:30.h,
            ),
           Lottie.asset("assets/anime/delivery.json"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Column(
                children: [
                  EmailTextField(
                    hintText: "Email",
                    prefixIcon: Icon(CupertinoIcons.mail , size: 22 , color: kGrayLight),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                 PasswordTextField(
                   controller: _passwordController,
                 ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to( RegistrationPage(),
                              transition: Transition.fadeIn,
                              duration: Duration(milliseconds: 1200));
                            },
                            child: Text("Register" , style: appstyle(Colors.blue, 13, FontWeight.normal),)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(text: "L O G I N",
                    onTap: () {
                      if(_emailController.text.isNotEmpty && _passwordController.text.length >=8){
                        LoginModel model = LoginModel(email: _emailController.text,
                            password: _passwordController.text);

                       String data = loginModelToJson(model);
                        controller.loginFunction(data);
                       //login function
                      }
                    },
                    btnHeight: 35.h,
                    btnWidth:width,
                  ),

                ],
              ),
            )
          ],
                ),
        ),),
    );
  }
}
