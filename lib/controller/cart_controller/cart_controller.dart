
import 'package:blush/model/cart_model/cart_model.dart';
import 'package:blush/model/sub_catagory_model/sub_catgory_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final Map<String, CartModel> _cartItems = <String, CartModel>{}.obs;

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }



  void addItemsToCart({
    required String itemId,
    required int quantity,
    required String timeSlot,
    required String dateForBooking,
    required String userId,
    required SubCatagoryModel subModel
  }) {
    _cartItems.putIfAbsent(
        itemId,
        () => CartModel(
          imageUrl: subModel.imageUrl,
          title: subModel.title,
          subCatDiscription: subModel.subCatDiscription,
            cartId: DateTime.now().toString(),
            itemId: itemId,
            quantity: quantity,
            userId: userId,
            dateForBooking: dateForBooking,
            timeSlot: timeSlot)); 
 
  }




  void removeOneItem({required String itemId}) {
    _cartItems.remove(itemId);
  
  }
}
