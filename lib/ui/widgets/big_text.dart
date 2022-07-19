import 'package:flutter/material.dart';
import 'package:food_app_flutter/ui/colors.dart';

class BigText extends StatelessWidget {
  String text;
  Color? color = const Color(0xff332d2b);
  double size;
  TextOverflow overFlow;

  BigText(
      {required this.text,
      this.color,
      this.size = 20.00,
      this.overFlow = TextOverflow.ellipsis,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.w400),
    );
  }
}
