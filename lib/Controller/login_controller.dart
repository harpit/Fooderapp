import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/models/apiError.dart';
import 'package:foodapp/models/login_response.dart';
import 'package:foodapp/views/auth/verification_page.dart';
import 'package:foodapp/views/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  final box = GetStorage();
    RxBool _isLoading = false.obs;

    bool get isLoading => _isLoading.value;

    set setLoading(bool newState){
      _isLoading.value = newState;

    }

    void loginFunction(String data)async{
      setLoading = true;

      Uri url = Uri.parse('$appBaseUrl/login');
      Map<String , String> headers = {'Content-Type' : 'application/json'};
      try{
        var response = await http.post(url,headers: headers , body: data);
        print(response.statusCode);
        if(response.statusCode == 200){
          LoginResponse data = loginResponseFromJson(response.body);

          String userId = data.id;
          String userData = jsonEncode(data);
          box.write(userId, userData);
          box.write("token", data.userToken);
          box.write("userId", data.id);
          box.write("verification", data.verification);
          setLoading = false;
          
          Get.snackbar("You are successfully logIn", "Enjoy your Awesome Experience",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
            icon: Icon(Ionicons.fast_food_outline)
          );

          if(data.verification == false){
            Get.offAll(()=>VerificationPage(),
            transition: Transition.fade,
            duration: Duration(milliseconds: 900));
          }
          if(data.verification == true) {
            Get.offAll(() => MainScreen(),
                transition: Transition.fade,
                duration: Duration(milliseconds: 900));
          }
        }else{
          var error = apiErrorFromJson(response.body);
          Get.snackbar("Failed to logIn", error.message,
              colorText: kLightWhite,
              backgroundColor: kRed,
              icon: Icon(Icons.error_outline));
        }
      }catch(e){
        debugPrint(e.toString());
      }
    }
   void logout(){
      box.erase();
      Get.offAll(()=>MainScreen(),
      transition: Transition.fade,
      duration: Duration(milliseconds: 900));
   }

   LoginResponse? getUserInfo(){
      String? userId = box.read("userId");
      String? data;
      if(userId != null){
        data = box.read(userId.toString());
      }
      if(data != null){
        return loginResponseFromJson(data);
      }
      return null;
   }
}