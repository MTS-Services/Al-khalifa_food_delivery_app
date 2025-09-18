import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double size;
  final Color borderColor;
  final double borderWidth;
  final Color? fillColor;

  const CustomCircle({
    super.key,
    this.size = 24,
    this.borderColor = Colors.grey,
    this.borderWidth = 2,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
