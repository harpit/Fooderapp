import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/Reusebletext.dart';
import 'package:foodapp/common/app_style.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightWhite,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: Padding(
            padding: EdgeInsets.only(right:12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/pak.svg", height: 25.h, width: 25.w,),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 2.w,
                  height: 15.h,
                  color: kGrayLight,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text("PAK", style: appstyle(kDark, 16, FontWeight.normal)),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                   //setting page
                  },
                  child: Padding(padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(SimpleLineIcons.settings, size: 16.h,),),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
