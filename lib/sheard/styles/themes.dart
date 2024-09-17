
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme =  ThemeData(
  primarySwatch: Colors.deepOrange,


  scaffoldBackgroundColor: Colors.white,



  appBarTheme: AppBarTheme(

    titleSpacing:27.0 ,



    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,


    ),


    backgroundColor: Colors.white,                           // any appbar apply on all app

    titleTextStyle: TextStyle(

      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),


  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    // backgroundColor: HexColor('333739'),

  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(

    backgroundColor: Colors.deepOrange,
  ),

  textTheme: TextTheme(
      bodyLarge :TextStyle(

        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )

  ),



);





ThemeData  darkTheme =  ThemeData(

  primarySwatch: Colors.deepOrange,


  scaffoldBackgroundColor: HexColor('333739'),



  appBarTheme: AppBarTheme(

    titleSpacing:27.0 ,



    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness: Brightness.light,


    ),


    backgroundColor: HexColor('333739'),                           // any appbar apply on all app

    titleTextStyle: TextStyle(

      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),


  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,

  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(

    backgroundColor: Colors.deepOrange,
  ),

  textTheme: TextTheme(
      bodyLarge :TextStyle(

        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )

  ),


);