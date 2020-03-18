import 'package:flutter/material.dart';

Widget customContainer(
    {double width,
    double height,
    double radius = 0.0,
    EdgeInsets padding,
    @required Widget child}) {
  return Container(
      width: width,
      height: height,
      padding: padding != null ? padding : EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Color(0xFFF0EFF4),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFD8DCE5),
                offset: Offset(5.0, 5.0),
                blurRadius: 13.0,
                spreadRadius: 2.0),
            BoxShadow(
                color: Color(0xFFFFFFFF),
                offset: Offset(-5.0, -5.0),
                blurRadius: 13.0,
                spreadRadius: 2.0),
          ]),
      child: child);
}
