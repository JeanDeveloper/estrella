import 'package:delivery/presentation/screen/login/login_screen.dart';
import 'package:delivery/presentation/screen/splash/splash_screen.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: lightTheme,
      home: LoginScreen(),
    );
  }
}
