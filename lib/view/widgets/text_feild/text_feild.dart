



import 'package:blush/core/color/colours.dart';
import 'package:flutter/material.dart';


class TextFeildCommonWidget extends StatelessWidget {
  const TextFeildCommonWidget({
    Key? key,
    required this.textEditingControllers,
    required this.labelText,
    required this.preFixIcons,
    this.passwordIcons,
    this.isVisible,
    this.onChanged,
    this.errorMessages
  }) : super(key: key);

  final TextEditingController textEditingControllers;
  final String labelText;
  final Widget? passwordIcons;
  final Icon? preFixIcons;
final bool? isVisible;
final String? errorMessages; 
final void Function(String)? onChanged;   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        onChanged: onChanged, 
        obscureText: isVisible ?? false,    
        controller: textEditingControllers,
        cursorColor: commonSecondaryYellow,
        decoration: InputDecoration(
          errorText: errorMessages,
            label: Text(
              labelText,
            ),
            floatingLabelStyle: const TextStyle(color: commonColorYellow,fontWeight: FontWeight.w800,fontSize: 18 ),
            suffixIcon: passwordIcons,
            prefixIcon: preFixIcons,
            labelStyle: const TextStyle(color: commonSecondaryYellow),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: blackColor,
                  width: 2.1,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: commonColorYellow, 
                  width: 2.0,
                )),
            fillColor: whiteColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
