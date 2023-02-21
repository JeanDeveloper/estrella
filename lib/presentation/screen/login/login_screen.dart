import 'package:delivery/presentation/screen/home/home_screen.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          //CABECERA
          Expanded(
            flex: 2,
            child: Stack(
              children: [

                Positioned(
                  bottom: 50,
                  left: -25,
                  right: -25,
                  height: size.width  + 25,
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(200)
                      ),

                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: deliveryGradients,
                        stops: const [
                          0.5,
                          1.0
                        ]
                      ),

                    ),
                    
                  )
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).canvasColor,
                    radius: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        "assets/delivery_splash.svg",
                      ),
                    ) ,
                  )
                )

              ],
            )

          ),
          
          //FORM
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: size.height * .05),
                    Text(
                      "Iniciar Sesion",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: size.height * .1),
                    Text(
                      "Usuario",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: size.height * .01),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Usuario"
                      ),
                    ),
                    SizedBox(height: size.height * .05),
                    Text(
                      "Contraseña",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: size.height * .01),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Contraseña"
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),

          ),

          //BUTTON
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
          
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ( _ ) => HomeScreen(), 
                    )
                  );
                },  
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * .001,
          
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: deliveryGradients,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
              
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      "Ingresar", 
                      style: TextStyle( color: Colors.white ),
                        textAlign: TextAlign.center,
                    ),
                  ),
          
                ),
              ),
            ),
          ),

        ],
      )
    );
  }
}