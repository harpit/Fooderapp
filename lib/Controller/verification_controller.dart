// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/models/apiError.dart';
import 'package:foodapp/models/login_response.dart';
import 'package:foodapp/views/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class VerificationController extends GetxController {
  final box = GetStorage();
  
 String _code = "";
 String get code => _code;

 set setCode(String value){
   _code = value;
 }

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verificationFunction() async {
    setLoading = true;
    String accessToken = box.read("token");
    Uri url = Uri.parse('$appBaseUrl/api/users/verify/$code');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.get(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);
        box.write(userId, userData);
        box.write("token", data.userToken);
        box.write("userId", data.id);
        box.write("verification", data.verification);
        setLoading = false;

        Get.snackbar(
            "You are successfully verified", "Enjoy your Awesome Experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(Ionicons.fast_food_outline));
            Get.offAll(()=>MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Failed to verify Account", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
