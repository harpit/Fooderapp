import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/models/restaurants_model.dart';
import 'package:foodapp/views/restaurant/widget/explore_widget.dart';
import 'package:foodapp/views/restaurant/widget/restaurant_bottom_bar.dart';
import 'package:foodapp/views/restaurant/widget/restaurant_menu.dart';
import 'package:foodapp/views/restaurant/widget/restaurant_top_bar.dart';
import 'package:foodapp/views/restaurant/widget/row_text.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: widget.restaurant!.imageUrl),
                ),
                Positioned(
                    bottom: 0, child: RestaurantBottomBar(widget: widget)),
                Positioned(
                  top: 25.h,
                  left: 0,
                  right: 0,
                  child: RestaurantTopBar(widget: widget),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  const RowText(
                      first: "Distance to Restaurant", second: "2.7 km"),
                  SizedBox(
                    height: 3.h,
                  ),
                  const RowText(first: "Estimated Price", second: "\PKR 2.7"),
                  SizedBox(
                    height: 3.h,
                  ),
                  const RowText(first: "Estimated TIme", second: "30 min"),
                  const Divider(
                    thickness: 0.7,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                height: 35.h,
                width: width,
                decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(25.r)),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(25.r)),
                    labelPadding: EdgeInsets.zero,
                    labelColor: kLightWhite,
                    unselectedLabelColor: kGrayLight,
                    unselectedLabelStyle:
                        appstyle(kLightWhite, 14, FontWeight.normal),
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: width / 2,
                          height: 25,
                          child: Center(child: Text("Menu")),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: width / 2,
                          height: 25,
                          child: Center(child: Text("Explore")),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(restaurantId: widget.restaurant!.id,),
                    ExploreWidget(code: widget.restaurant!.code,)
                  ],
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
