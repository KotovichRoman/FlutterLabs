import 'package:flutter/material.dart';

class ApplicationConcerns {
  static Text createTextWithOptions(
      String text, double fontSize, List<int> color, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: Color.fromARGB(color[0], color[1], color[2], color[3]),
          fontWeight: fontWeight,
          fontFamily: "Roboto"),
    );
  }
}
