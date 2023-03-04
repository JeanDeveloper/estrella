import 'package:delivery/presentation/screen/cart/cart_screen.dart';
import 'package:delivery/presentation/screen/home/products/products_screen.dart';
import 'package:delivery/presentation/screen/profile/profile_screen.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,

              children: [
                ProductsScreen(),
                Text("CurrentIdex2: ${_currentIndex}"),
                CartScreen(
                  goShopping: (){
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),  
                Text("CurrentIdex4: ${_currentIndex}"),
                ProfileScreen(),
              ],

            )
          ),
          _DeliveryNavigatorBar(
            index: _currentIndex,
            onIndexSelected: (index){
              setState(() {
                _currentIndex = index;
              });
            }

          ),
        ],
      )
    );
  }
}


class _DeliveryNavigatorBar extends StatelessWidget {

  final int index;
  final ValueChanged<int> onIndexSelected;

  const _DeliveryNavigatorBar({super.key, required this.index, required this.onIndexSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2,
            color: Theme.of(context).dividerColor
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  icon: const Icon(Icons.home),
                  color: index == 0 ? DeliveryColors.green : DeliveryColors.lightGrey,
                  onPressed: () => onIndexSelected(0), 
                ),
              ),
              Material(
                child: IconButton(
                  icon: const Icon(Icons.store),
                  color: index == 1 ? DeliveryColors.green : DeliveryColors.lightGrey,


                  onPressed: () => onIndexSelected(1), 
                ),
              ),
              Material(
                child: CircleAvatar(
                  backgroundColor: DeliveryColors.purple,
                  child: IconButton(
                  color: index == 2 ? DeliveryColors.green : DeliveryColors.white,

                    icon: const Icon(Icons.shopping_basket),
                    onPressed: () => onIndexSelected(2), 

                  ),
                ),
              ),
              Material(
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: index == 3 ? DeliveryColors.green : DeliveryColors.lightGrey,

                  onPressed: () => onIndexSelected(3), 
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4), 
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
              
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}