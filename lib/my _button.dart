import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key, this.containerColor, this.buttonTextColor, this.buttonText,this.onTap,this.onLongPress})
      : super(key: key);
  String? buttonText;
  Color? buttonTextColor;
  Color? containerColor;
  final onTap;
final onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: containerColor,borderRadius: BorderRadius.circular(10) ),
          child: Center(
            child: Text(
              buttonText!,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: buttonTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
