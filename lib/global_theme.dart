import 'package:flutter/material.dart';

const Color customPurple1 = Color(0xffdccaff);
const Color customPurple2 = Color(0xffd2bbff);
const Color customPurple3 = Color(0xffc0a0ff);
const Color customPurple4 = Color(0xff7371b4);
const Color customPurple5 = Color(0xff555389);

const Color customDark = Color(0xff3c3b55);
const Color customLight = Color(0xfffafafa);
const Color customGray = Color(0xffa2a2a5);

const Color customTransparent = Color(0xffffff);
const Color customOverlay30 = Color(0x4D000000);

const Color customSurfaceWhite =  Colors.white;
const Color customBackgroundWhite = Colors.white;

class GlobalTheme {
  final globalTheme = ThemeData(
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        color: customPurple3,
      ),
      bodyText2: TextStyle(
        color: customPurple4,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: customPurple5,
      ),
      headline1: TextStyle(
        color: customPurple4,
        fontSize: 60,
        fontFamily: 'Allison',
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: customPurple4,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: customPurple5),
      actionsIconTheme: IconThemeData(color: customPurple5),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: customPurple3,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
        fontSize: 40,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: customPurple4,
      unselectedLabelColor: customGray
    )
  );
}

const ColorScheme _customColorScheme = ColorScheme(
  primary: customPurple1,
  onPrimaryContainer: customPurple4,
  secondary: customPurple3,
  onSecondaryContainer: customPurple4,
  surface: Colors.purpleAccent,
  background: customSurfaceWhite,
  error: Color(0xFFC5032B),
  onPrimary: customPurple5,
  onSecondary: customPurple5,
  onSurface: Colors.pink,
  onBackground: customPurple1,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);
