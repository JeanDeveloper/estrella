import 'package:delivery/presentation/screen/login/login_screen.dart';
import 'package:delivery/presentation/screen/splash/splash_screen.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final _borderLight = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: DeliveryColors.lightGrey,
        width: 2,
        style: BorderStyle.solid
      )
    );

    final _borderDark = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: DeliveryColors.grey,
        // width: 2,
        style: BorderStyle.solid
      )
    );

    final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: DeliveryColors.white,

        titleTextStyle: GoogleFonts.poppins().copyWith(
          color: DeliveryColors.purple, 
          fontWeight: FontWeight.bold,
          fontSize: 18
        )

      ),

      canvasColor: DeliveryColors.white,
      disabledColor: DeliveryColors.grey,

      dividerColor: DeliveryColors.veryLightGrey,

      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.purple,
        displayColor: DeliveryColors.purple,
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        border: _borderLight,
        enabledBorder: _borderLight,
        focusedBorder: _borderLight,
        labelStyle: TextStyle(color: DeliveryColors.purple),
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.grey,
          fontSize: 10
        ),
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.purple,
      ),

    );

    final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: DeliveryColors.purple,
        titleTextStyle: GoogleFonts.poppins().copyWith(
          fontSize: 20,
          color: DeliveryColors.white,
          fontWeight: FontWeight.bold
        )
      ),
      dividerColor: Colors.transparent,

      canvasColor: DeliveryColors.grey,
      disabledColor: DeliveryColors.white,
      scaffoldBackgroundColor: DeliveryColors.dark,
      textTheme: GoogleFonts.poppinsTextTheme().apply( bodyColor: DeliveryColors.green, displayColor: DeliveryColors.green ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: DeliveryColors.grey,
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        labelStyle: TextStyle(color: DeliveryColors.white),
        hintStyle: GoogleFonts.poppins( 
          color: DeliveryColors.white,
          fontSize: 10
        ),
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.white,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: darkTheme,
      home: LoginScreen(),
    );

  }
}
