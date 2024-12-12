import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/registration_controller.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/common/background_container.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/models/registration_model.dart';
import 'package:foodapp/views/auth/widget/email_textfield.dart';
import 'package:foodapp/views/auth/widget/password_textfield.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _usernameController = TextEditingController();
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
    final controller = Get.put(RegistrationController());
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
                      hintText: "Username",
                      prefixIcon: Icon(CupertinoIcons.person , size: 22 , color: kGrayLight),
                      controller: _usernameController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
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
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(text: "R E G I S T E R",
                      onTap: () {
                        if(_emailController.text.isNotEmpty &&
                            _usernameController.text.isNotEmpty &&
                            _passwordController.text.length >=8){
                          RegistrationModel model = RegistrationModel(username: _usernameController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                           String data = registrationModelToJson(model);
                          controller.registrationFunction(data);

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
