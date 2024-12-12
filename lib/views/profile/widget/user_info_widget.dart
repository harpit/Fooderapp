import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, this.user});
  final LoginResponse? user;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: kSecondary,
                backgroundImage: NetworkImage(
                  user!.profile
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 6.h,
                  left: 8.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                     user!.username ?? "Username",
                      style: TextStyle(
                          fontSize: 15,
                          color: kGray,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.65,
                      child: Text(user!.email ??"xtz@gmail.com",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              color: kGrayLight,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              MaterialCommunityIcons.account_edit,size: 33,
            ),
          )
        ],
      ),
    );
  }
}
