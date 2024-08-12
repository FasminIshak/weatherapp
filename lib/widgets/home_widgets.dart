import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const Home({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 30,
    this.fontWeight = FontWeight.bold,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
