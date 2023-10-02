import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:tccApp/utils/theme/temas.dart';

InputDecoration inputDecoration(String label, String helper,
        {Widget? suffixIcon, String? counter}) =>
    InputDecoration(
      labelText: label,
      helperText: helper,
      counterText: counter,
      helperMaxLines: 2,
      counterStyle: TextStyle(fontSize: 12),
      errorStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      helperStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 28),
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Temas.elementsColor, width: 2),
          borderRadius: BorderRadius.circular(40.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Temas.primaryColor),
        borderRadius: BorderRadius.circular(40.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(40.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Temas.primaryColor),
        borderRadius: BorderRadius.circular(40.0),
      ),
      suffixIcon: suffixIcon,
    );

var primaryfont = GoogleFonts.notoSansTextTheme();

const principalText = TextStyle(
  color: Colors.black,
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
);
const principalText2 = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
);
const principalTextWithBold = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const textOpMenu =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

textHint() {
  return TextStyle(color: Colors.black, fontSize: 18);
}

const textMenu =
    TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400);
