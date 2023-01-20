import 'package:blush/controller/cart_controller/cart_controller.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/core/size/size.dart';
import 'package:blush/service/login_services/login_services.dart';
import 'package:blush/view/cart_screen/cart_screen.dart';
import 'package:blush/view/home/home_screen.dart';
import 'package:blush/view/price_list/price_list_screen.dart';
import 'package:blush/view/widgets/main_home/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = LoginServices.fireBaseAuth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commonSecondaryYellow,
        elevation: 0,
        title: Text(username.currentUser!.email.toString(),style: GoogleFont.buttonTextStyle,),
        actions: [
          GestureDetector(
            onTap: () {
              username.signOut(); 
              Get.offAll(()=>const HomeScreen());   
            },
            child: const Icon(Icons.logout_outlined,color: blackColor,)),
          kWidth15,
          CartIconCommonWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GridView.count(crossAxisCount: 2, children: [
          GestureDetector(
            onTap: () {},
            child: const DasboardTileWidget(
              imageUrl: 'assets/sales.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const DasboardTileWidget(
              imageUrl: 'assets/appointments.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => PriceListScreen());
            },
            child: const DasboardTileWidget(
              imageUrl: 'assets/pricelist.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const DasboardTileWidget(
              imageUrl: 'assets/settings.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const DasboardTileWidget(
              imageUrl: 'assets/accounts.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const DasboardTileWidget(
              imageUrl: 'assets/report.jpg',
            ),
          ),
        ]),
      ),
    );
  }
}

class CartIconCommonWidget extends StatelessWidget {
  CartIconCommonWidget({
    Key? key,
  }) : super(key: key);
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() =>  CartScreen());
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 15, left: 4, right: 5),
            child: Icon(
              Icons.shopping_cart,
              color: blackColor,
              size: 30,
            ),
          ),
        ),
        Obx( () {
          return cartController.getCartItems.isNotEmpty 
              ? Positioned( 
                  top: 8,
                  left: 18,
                  child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 9,
                      child: Center(
                          child: Text(
                        cartController.getCartItems.length.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, color: blackColor),
                      ))))
              : const SizedBox();
        })
      ],
    );
  }
}
