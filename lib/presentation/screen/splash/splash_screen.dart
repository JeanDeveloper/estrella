import 'package:delivery/presentation/screen/login/login_screen.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {

    Future.delayed(const Duration(seconds: 5),   (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) => LoginScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DeliveryColors.green,
              DeliveryColors.purple
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: size.aspectRatio * 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/delivery_splash.svg"),
              ) ,
            ),
            SizedBox(height: size.height * .05 ,),
            Text(
              "Estrella", 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: DeliveryColors.white,
              )
            )
          ],
        ),
      ),
    );
  }
}