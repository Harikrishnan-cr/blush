import 'package:blush/controller/cart_controller/cart_controller.dart';
import 'package:blush/controller/sub_catagory_controller/sub_catagory_controller.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/model/cart_model/cart_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final cartItems = cartController.getCartItems.values.toList();
    return Scaffold(
      appBar: AppBar(
        title:  Text('Cart',style: GoogleFont.buttonTextStyle),
        centerTitle: true, 
        elevation: 0,
        backgroundColor: commonSecondaryYellow,
      ),
      body: Obx(() {
        return cartController.getCartItems.isNotEmpty ? ListView(
          children: List.generate(cartController.getCartItems.length, (index) {
            return CartTileWidget(cartData: cartItems[index]);
          }),
        ) : SizedBox(
         child: Center(child: Text('No Items In Cart',style: GoogleFont.buttonTextStyle,),),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
              color: commonColorYellow,
              borderRadius: BorderRadius.circular(18)),
          child: Center(
              child: Text(
            'Book Now',
            style: GoogleFont.buttonTextStyle,
          )),
        ),
      ),
    );
  }
}

class CartTileWidget extends StatelessWidget {
  CartTileWidget({
    Key? key,
    required this.cartData,
  }) : super(key: key);
  final CartModel cartData;

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              offset: Offset(8, 8),
              blurRadius: 12,
              color: Color.fromARGB(255, 31, 31, 31),
            )
          ],
          gradient: const LinearGradient(
              colors: [
                whiteColor,
                blackColor,
              ],
              begin: FractionalOffset(0.5, 2.9),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: commonColorYellow,
                      image: DecorationImage(
                          image: AssetImage(cartData.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(cartData.title,
                            style: GoogleFont.priceListTextStyleHead),
                        SizedBox(
                            width: 180,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartData.timeSlot,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFont.buttonTextStyle,
                                    ),
                                    Text(
                                      cartData.dateForBooking,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFont.buttonTextStyle,
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cartController.removeOneItem(
                                itemId: cartData.itemId);
                          },
                          child: Container(
                              width: 80,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.amber,
                              ),
                              child: Center(
                                  child: Text('Remove',
                                      style: GoogleFont.splashScreenText))),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
