import 'package:flutter/material.dart';

abstract class Temas {
  //cores
  static const primaryColor = Color(0xFF2c7b40);
  static const bgColor = Color(0xFFFFFFFF);
  static const lowDegradeColor = Color(0xFF5bb977);
  static const highDegradeColor = Color(0xFF3c995e);
  static const elementsColor = Color(0xFFdbe9db);
  static const defaultPadding = 14.0;
  static const defaultHorizontalPadding = 30.0;
  static const defaultVerticalPadding = 30.0;

//cores dos botões
  static const gradientDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(40)),
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[highDegradeColor, lowDegradeColor],
    ),
  );

  static var buttonDecoration = ButtonStyle(
    overlayColor:
        MaterialStateProperty.all<Color>(Temas.primaryColor.withOpacity(.2)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    )),
  );
}
