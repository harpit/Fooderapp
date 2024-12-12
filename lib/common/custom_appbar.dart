import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h, left: 20, right: 10),
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
                  backgroundImage: const NetworkImage(
                      "https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp"),
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
                      const Text(
                        "Deliver to",
                        style: TextStyle(
                            fontSize: 15,
                            color: kSecondary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.65,
                        child: const Text("Karachi, Pakistan",
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
            Text(
              getTimeOfDay(),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 6 && hour < 12) { // Morning: 6 AM to 11:59 AM
      return ' 🌞 ';
    } else if (hour >= 12 && hour < 18) { // Afternoon/Evening: 12 PM to 5:59 PM
      return ' ⛅ ';
    } else { // Night: 6 PM to 5:59 AM
      return ' 🌙 ';
    }
  }
}
