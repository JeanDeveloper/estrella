import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {

static final purple         =  Color(0xFF5117AC);
static final green          =  Color(0xFF20D0C4);
static final dark           =  Color(0xFF03091E);
static final grey           =  Color(0xFF212738);
static final lightGrey      =  Color(0xFFBBBBBB);
static final veryLightGrey  =  Color(0xFFF3F3F3);
static final white          =  Color(0xFFFFFFFF);
static final pink           =  Color(0xFFF5638B);

}


final deliveryGradients = [
  DeliveryColors.green,
  DeliveryColors.purple
];


final _border = OutlineInputBorder(

  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: DeliveryColors.lightGrey,
    width: 2,
    style: BorderStyle.solid
  )

);

final lightTheme = ThemeData(

  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: _border,
    enabledBorder: _border,
    focusedBorder: _border,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.lightGrey,
      fontSize: 10
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.purple,
  ),

);




final darkTheme = ThemeData(

  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: _border,
    enabledBorder: _border,
    focusedBorder: _border,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.lightGrey,
      fontSize: 10
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.purple,
  ),

);