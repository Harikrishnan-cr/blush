



import 'package:flutter/cupertino.dart';

class AppMainLogoWidget extends StatelessWidget {
  const AppMainLogoWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.isReapet
  }) : super(key: key);

  final double width;
  final double height;
final bool isReapet;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('assets/hair-blush.png',width: width*0.5,height: height*0.5,) 
            );
  }
}
