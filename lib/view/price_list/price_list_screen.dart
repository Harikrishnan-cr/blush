import 'package:blush/controller/main_catagory_controller/main_catgory_controller.dart';
import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:blush/view/app_home/home_main.dart';

import 'package:blush/view/price_list/sub_catgory_screen/sub_catgory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceListScreen extends StatelessWidget {
  PriceListScreen({super.key});
  final String titleText = 'Hair';
  final String image = 'assets/haircut.jpg';
  final mainCatagoryController = Get.put(MainCatagoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commonSecondaryYellow,
        title:  Text('Price list',style:GoogleFont.buttonTextStyle,),
        actions: [
            CartIconCommonWidget(),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: mainCatagoryController.mainCatagory.length,
          itemBuilder: (context, index) {
            final data = mainCatagoryController.mainCatagory[index];
            return GestureDetector(
                onTap: () {
                  Get.to(() => SubCatgoryScreen(
                        catId: data.id,
                        heading: data.title,
                      ));
                },
                child: PriceListWidget(
                    image: data.imageUrl, titleText: data.title));
          },
        );
      }),
    );
  }
}

class PriceListWidget extends StatelessWidget {
  const PriceListWidget({
    Key? key,
    required this.image,
    required this.titleText,
  }) : super(key: key);

  final String image;
  final String titleText;

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
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    Text(titleText, style: GoogleFont.priceListTextStyleHead),
                    SizedBox(
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFont.splashScreenText,
                          ),
                        ))
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
