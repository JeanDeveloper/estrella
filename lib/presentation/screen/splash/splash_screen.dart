import 'package:delivery/domain/repository/Ilocal_storage_repository.dart';
import 'package:delivery/domain/repository/iapi_repository.dart';
import 'package:delivery/presentation/providers/splash_bloc.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen._();

  static Widget init( BuildContext context ){
    return ChangeNotifierProvider(
      create: (_) => SplashBloc(
        localRepository: context.read<ILocalRepository>(),
        apiRepository: context.read<IApiRepository>(),
      )..validateSesion(),
      builder: ( _ , __ ) => SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _init() async {
    final bloc = context.read<SplashBloc>();
    final result  = await  bloc.validateSesion();
    print(result);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(( _ ) {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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