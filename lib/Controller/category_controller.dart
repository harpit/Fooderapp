import 'package:get/get.dart';

class categoryController extends GetxController{
  RxString _category = ''.obs;
  String get categoryValue => _category.value;
  set updateCategory(String value){
    _category.value = value;
    print(_category.value);
  }

  RxString _title = ''.obs;
  String get titleValue => _title.value;
  set updatetitle(String value){
    _title.value = value;
  }
}