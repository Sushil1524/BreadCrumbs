import 'package:flutter/material.dart';

const largeTextStyle = 26.0;
const mediumTextStyle = 20.0;
const smallTextStyle = 16.0;

const String fontNameDefault = "Montserrat";

const scaffoldBackgroundColor = Color.fromARGB(255, 0, 0, 0);
const accountBoxColor = Color.fromARGB(255, 7, 13, 23);
const totalBalanceGradientStart = Color.fromARGB(255, 12, 21, 35);
const totalBalanceGradientEnd = Color.fromARGB(255, 7, 13, 23);

const bottomNavbarBgColor = Color.fromARGB(255, 7, 13, 23);
const bottomNavbarSelectedColor = Color(0xFFF59E0B);
const bottomNavbarUnselectedColor = Colors.white54;

const appBarTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w600,
  fontSize: mediumTextStyle,
  color: Colors.white,
);

const titletextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.bold,
  fontSize: largeTextStyle,
  color: Colors.white,
);

const bodyTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: smallTextStyle,
  color: Colors.white70,
);

final appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  primaryColor: const Color(0xFF3B82F6),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF3B82F6),
    secondary: Color(0xFFF59E0B),
    surface: accountBoxColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: appBarTextStyle,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: bottomNavbarBgColor,
    selectedItemColor: bottomNavbarSelectedColor,
    unselectedItemColor: bottomNavbarUnselectedColor,
    type: BottomNavigationBarType.fixed,
  ),
);
