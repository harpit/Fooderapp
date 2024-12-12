import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/Controller/food_controller.dart';
import 'package:foodapp/common/app_style.dart';
import 'package:foodapp/common/custom_button.dart';
import 'package:foodapp/common/custom_text_field.dart';
import 'package:foodapp/hooks/fetch_restaurant.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:foodapp/views/auth/phone_verification_page.dart';
import 'package:foodapp/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _preferences = TextEditingController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodController());
    controller.loadAdditives(widget.food.additives);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.r),
            ),
            child: Stack(children: [
              SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (i) {
                      controller.changePage(i);
                    },
                    itemCount: widget.food.imageUrl.length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: width,
                        height: 235.h,
                        color: kLightWhite,
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.food.imageUrl[i]),
                      );
                    },
                  )),
              Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Obx(() =>
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            List.generate(widget.food.imageUrl.length, (index) {
                              return Container(
                                margin: EdgeInsets.all(4.h),
                                width: 13.w,
                                height: 13.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.currentPage == index
                                        ? kSecondary
                                        : kGrayLight),
                              );
                            }))),
                  )),
              Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Ionicons.chevron_back_circle,
                      size: 30,
                      color: Colors.orangeAccent,
                    ),
                  )),
              Positioned(
                  bottom: 13,
                  right: 15.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(() =>
                          RestaurantPage(
                            restaurant: hookResult.data,
                          ));
                    },
                    btnWidth: 120.w,
                    text: "Open Restaurants",
                  )),
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.food.title,
                        style: appstyle(kDark, 20, FontWeight.w600)),
                    Obx(() =>
                        Text(
                            "\PKR ${((widget.food.price + controller.additivePrice) * controller.count.value)}",
                            style: appstyle(
                                Colors.orangeAccent, 20, FontWeight.w600)))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: appstyle(kGray, 14, FontWeight.w400)),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 20.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                    List.generate(widget.food.foodTags.length, (index) {
                      final tag = widget.food.foodTags[index];
                      return Container(
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(tag,
                              style: appstyle(kWhite, 12, FontWeight.w500)),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text("Additives and Topping",
                    style: appstyle(kDark, 20, FontWeight.w700)),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                 children:
                 List.generate(controller.additivesList.length, (index) {
                   final additives = controller.additivesList[index];
                   return Obx(()=>CheckboxListTile(
                       contentPadding: EdgeInsets.zero,
                       visualDensity: VisualDensity.compact,
                       dense: true,
                       activeColor: Colors.orangeAccent,
                       value: additives.isChecked.value,
                       tristate: false,
                       title: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(additives.title,
                               style: appstyle(kDark, 12, FontWeight.w400)),
                           SizedBox(
                             width: 5.w,
                           ),
                           Text("PKR ${additives.price}",
                               style:
                               appstyle(kPrimary, 12, FontWeight.w600)),
                         ],
                       ),
                       onChanged: (bool? value) {
                         additives.toggleChecked();
                         controller.getTotalPrice();
                       }));
                 }),
               ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity",
                        style: appstyle(kDark, 18, FontWeight.bold)),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.increment();
                          },
                          child: const Icon(AntDesign.pluscircleo),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Obx(() =>
                              Text(
                                "${controller.count.value}",
                                style: appstyle(kDark, 14, FontWeight.w600),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.decrement();
                          },
                          child: const Icon(AntDesign.minuscircleo),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                Text("Preferences",
                    style: appstyle(kDark, 18, FontWeight.bold)),
                SizedBox(height: 5.h,),
                SizedBox(height: 65.h,
                  child: CustomTextWidget(
                    controller: _preferences,
                    hintText: "Include a note detailing your preferences.",
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 15.h,),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showVerificationSheet(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text("Place Order", style: appstyle(
                              kLightWhite, 18, FontWeight.w600)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: kSecondary,
                          radius: 20.r,
                          child: const Icon(
                            Ionicons.cart,
                            color: kLightWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 580.h,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/restaurant_bk.png"),
                    fit: BoxFit.fill
                ),
                color: kLightWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                )
            ),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Text(
                        "Verify Your Phone Number",
                        style: appstyle(kDark, 18, FontWeight.w600)
                    ),
                    SizedBox(height: 15.h),
                    Column(
                      children: List.generate(
                          verificationReasons.length,
                              (index) {
                            return ListTile(
                              leading: Icon(
                                  Icons.check_circle_outline, color: kPrimary),
                              title: Text(
                                verificationReasons[index],
                                textAlign: TextAlign.justify,
                                style: appstyle(
                                    kGrayLight, 11, FontWeight.normal),
                              ),
                            );
                          }
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    CustomButton(text: "Verify Phone Number",
                      btnHeight: 35.h,
                      onTap: () {
                        Get.to(()=>PhoneVerificationPage());
                    },)
                  ],
                ),
              ),
            ),

          );
        }
        );
  }

}
