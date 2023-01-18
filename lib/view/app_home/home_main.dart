import 'package:blush/core/color/colours.dart';
import 'package:blush/service/login_services/login_services.dart';
import 'package:blush/view/widgets/main_home/dashboard_widget.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget { 
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = LoginServices.fireBaseAuth;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: commonSecondaryYellow,
          elevation: 0,
          title: Text(username.currentUser!.email.toString())),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GridView.count(crossAxisCount: 2, children: const [
          DasboardTileWidget(
            imageUrl: 'assets/sales.jpg',
          ),
          DasboardTileWidget( 
            imageUrl: 'assets/appointments.jpg',
          ),
          DasboardTileWidget(
            imageUrl: 'assets/pricelist.jpg',
          ),
          DasboardTileWidget(
            imageUrl: 'assets/settings.jpg',
          ),
          DasboardTileWidget(
            imageUrl: 'assets/accounts.jpg',
          ),
          DasboardTileWidget(
            imageUrl: 'assets/report.jpg',
          ),
        ]),
      ),
    );
  }
}
