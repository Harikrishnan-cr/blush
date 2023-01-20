
import 'package:blush/model/sub_catagory_model/sub_catgory_model.dart';
import 'package:get/get.dart';

class SubCatagoryController extends GetxController {
  RxList<SubCatagoryModel> subCatgoryList = <SubCatagoryModel>[].obs;
  RxList<SubCatagoryModel> subCatgoryListFinal = <SubCatagoryModel>[].obs;


  void addToSubCatagories({required List<SubCatagoryModel> data}) {
    subCatgoryList.value = data;
  }

  RxList<SubCatagoryModel> sortByCatogieId({required String catId}) {
    subCatgoryListFinal.value = subCatgoryList
        .where((element) => element.catId.contains(catId))
        .toList();
    return subCatgoryListFinal; 
  }



  
}
