import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/login_controller.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/common/custom_container.dart';
import 'package:foodapp/models/login_response.dart';
import 'package:foodapp/views/auth/login_redirect.dart';
import 'package:foodapp/views/auth/verification_page.dart';
import 'package:foodapp/views/profile/widget/profile_app_bar.dart';
import 'package:foodapp/views/profile/widget/profile_tile_widget.dart';
import 'package:foodapp/views/profile/widget/user_info_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        appBar: PreferredSize(preferredSize: Size.fromHeight(40.h), child:ProfileAppBar()),
        body: SafeArea(
          child: CustomContainer(containerContent: Column(
            children: [
              Column(
                  children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: UserInfoWidget(
                         user : user
                       ),
                     ),
                      SizedBox(height: 10.h,),
                      Container(
                        height: 180.h,
                        decoration: BoxDecoration(
                          color: kLightWhite,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          physics:const NeverScrollableScrollPhysics(),
                          children: [
                            ProfileTileWidget(
                              title: "My Order",
                              icon: Ionicons.fast_food_outline,
                              onTap: () {
                                Get.to( LoginRedirect());
                              },
                            ),
                            ProfileTileWidget(
                              title: "My Favourite Place",
                              icon: Ionicons.heart_outline,
                              onTap: () {},
                            ),
                            ProfileTileWidget(
                              title: "Reviews",
                              icon: Ionicons.chatbubble_outline,
                              onTap: () {},
                            ),
                            ProfileTileWidget(
                              title: "Coupons",
                              icon: MaterialCommunityIcons.tag_outline,
                              onTap: () {},
                            ),


                          ],
                        ),
                      ),
                    SizedBox(height: 16.h,),
                    Container(
                      height: 180.h,
                      decoration: BoxDecoration(
                        color: kLightWhite,
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics:const NeverScrollableScrollPhysics(),
                        children: [
                          ProfileTileWidget(
                            title: "Shipping Address",
                            icon: SimpleLineIcons.location_pin,
                            onTap: () {},
                          ),
                          ProfileTileWidget(
                            title: "Service Center",
                            icon: AntDesign.customerservice,
                            onTap: () {},
                          ),
                          ProfileTileWidget(
                            title: "Coupons",
                            icon: MaterialIcons.rss_feed,
                            onTap: () {},
                          ),
                          ProfileTileWidget(
                            title: "Settings",
                            icon: AntDesign.setting,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(text: "Logout" ,radius: 0,btnColor: Colors.redAccent,onTap: () {
                     controller.logout();
                    },)
                  ],
                ),
          ]
        )
          )

    ));
  }
}
