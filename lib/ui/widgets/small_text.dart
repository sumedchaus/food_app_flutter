import 'package:flutter/material.dart';
import 'package:food_app_flutter/ui/colors.dart';

class SmallText extends StatelessWidget {
  String text;
  Color color;
  double size;
  double height;


  SmallText(
      {required this.text,
      this.color = const Color(0xff332d2b),
      this.size = 12.00,
        this.height = 1.2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color,height: height),
    );
  }
}
