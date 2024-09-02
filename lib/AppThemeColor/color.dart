import 'package:flutter/material.dart';
const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFEAE2E6),
  100: Color(0xFFC9B8C1),
  200: Color(0xFFA68898),
  300: Color(0xFF82586E),
  400: Color(0xFF67354F),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF450F2B),
  700: Color(0xFF3C0C24),
  800: Color(0xFF330A1E),
  900: Color(0xFF240513),
});
const int _primaryPrimaryValue = 0xFF4C1130;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFF609C),
  200: Color(_primaryAccentValue),
  400: Color(0xFFF9005E),
  700: Color(0xFFE00054),
});
const int _primaryAccentValue = 0xFFFF2D7C;