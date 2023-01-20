import 'package:blush/model/catagory_model/catagory_model.dart';
import 'package:get/get.dart';

class MainCatagoryController extends GetxController {
  RxList<CatagoryModel> mainCatagory = <CatagoryModel>[].obs;

  void addToCatagories({required List<CatagoryModel> data}) {
    mainCatagory.value = data;
  }

  
}
