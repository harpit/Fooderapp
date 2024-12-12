import 'package:flutter/material.dart';
import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/models/apiError.dart';
import 'package:foodapp/models/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
 RxBool _isLoading = false.obs;
 bool get isLoading => _isLoading.value;

 set setLoading(bool value){
   _isLoading.value = value;
 }

 RxBool _isTriggered = false.obs;
 bool get isTriggered => _isTriggered.value;

 set setTriggered(bool value){
   _isTriggered.value = value;
 }

 List<FoodsModel>? searchResults;

 void searchFoods(String key)async{
   setLoading = true;
   Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");
   try{
     var response = await http.get(url);
     print(response.statusCode);
     if(response.statusCode == 200){
       searchResults = foodsModelFromJson(response.body);
       setLoading = false;
     }
     else{
       setLoading = false;
       var error = apiErrorFromJson(response.body);
     }
   }catch(e){
     setLoading = false;
     debugPrint(e.toString());
   }
 }
}
