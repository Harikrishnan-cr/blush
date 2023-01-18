



import 'package:blush/core/color/colours.dart';
import 'package:blush/core/fonts/fonts.dart';
import 'package:flutter/cupertino.dart';


class ButtonCommonFilledWidget extends StatelessWidget {
  const ButtonCommonFilledWidget({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: commonColorYellow,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        buttonText,
        style: GoogleFont.buttonTextStyle,
      )),
    );
  }
}
