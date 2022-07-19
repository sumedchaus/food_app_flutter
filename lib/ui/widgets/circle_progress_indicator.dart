import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../colors.dart';

class CircleProgressIndicator extends StatelessWidget {
  const CircleProgressIndicator({
    Key? key,
    this.size = 50,
    this.lineWidth = 3.0,
  }) : super(key: key);

  final double size;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(lineWidth: lineWidth, size: size, color: primarySwatchColor),
    );
  }
}
