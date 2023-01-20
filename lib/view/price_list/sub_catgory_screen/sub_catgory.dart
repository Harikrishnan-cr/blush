import 'package:blush/controller/cart_controller/cart_controller.dart';
import 'package:blush/controller/sub_catagory_controller/sub_catagory_controller.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/model/sub_catagory_model/sub_catgory_model.dart';
import 'package:blush/view/app_home/home_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCatgoryScreen extends StatelessWidget {
  SubCatgoryScreen({super.key, required this.catId, required this.heading});
  final String heading;
  final String catId;
  final subCatagoryController = Get.put(SubCatagoryController());
  @override
  Widget build(BuildContext context) {
    final subCatData = subCatagoryController.sortByCatogieId(catId: catId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commonSecondaryYellow,
        title: Text(heading, style: GoogleFont.buttonTextStyle),
        centerTitle: true,
        actions: [
          CartIconCommonWidget(),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: subCatData.length,
          itemBuilder: (context, index) {
            final data = subCatData[index];
            return SubCatagoryWidget(subCatagoryModel: data);
          },
        );
      }),
    );
  }
}

class SubCatagoryWidget extends StatelessWidget {
  SubCatagoryWidget({
    Key? key,
    required this.subCatagoryModel,
  }) : super(key: key);

  final SubCatagoryModel subCatagoryModel;

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
                      color: blackColor,
                      image: DecorationImage(
                          image: AssetImage(subCatagoryModel.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(subCatagoryModel.title,
                            style: GoogleFont.priceListTextStyleHead),
                        SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subCatagoryModel.subCatDiscription,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFont.splashScreenText,
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(() {
                          return !cartController.getCartItems
                                  .containsKey(subCatagoryModel.id)
                              ? GestureDetector(
                                  onTap: () {
                                    cartController.addItemsToCart(
                                        itemId: subCatagoryModel.id,
                                        quantity: 5,
                                        timeSlot: '11:00',
                                        dateForBooking: 'jan 12 2023',
                                        userId: '',
                                        subModel: subCatagoryModel);
                                  },
                                  child: Container(
                                      width: 80,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.amber,
                                      ),
                                      child: Center(
                                          child: Text('ADD',
                                              style: GoogleFont
                                                  .splashScreenText))),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    cartController.removeOneItem(
                                        itemId: subCatagoryModel.id);
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
                                              style: GoogleFont
                                                  .splashScreenText))),
                                );
                        }),
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
