import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLightColor = Color(0xff39A552);
  static Color greyColor = Color(0xff4F5A69);
  static Color redColor = Color(0xffC91C22);
  static Color darkBlueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color blackColor = Color(0xff303030);
  static Color whiteColor = Colors.white;


  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: MyTheme.primaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
      titleMedium: TextStyle(
          color: blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      titleSmall: TextStyle(
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
    )
  );
}