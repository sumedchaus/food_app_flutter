import 'package:flutter/material.dart';


class TextWithIcon extends StatelessWidget {
  TextWithIcon({
    required this.text,
    required this.iconLast,
    Key? key}) : super(key: key);
  String text;
  IconData iconLast;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text(text),
        Icon(iconLast),
      ],
    );
  }
}
