import 'package:delivery/data/in_memory_products.dart';
import 'package:delivery/domain/entities/product.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:delivery/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {

  final VoidCallback goShopping;

  const CartScreen({super.key, required this.goShopping});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart'
        ),
      ),
      body: _FullCart(),
    );
  }
}


class _FullCart extends StatelessWidget {
  const _FullCart({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:20.0, horizontal: 8),
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 200,
              itemBuilder: (context, index) {
                final product = products[index];
                return _ShoppingCartProduct(
                  product: product,
                );
              },
            ),
          )
        ),

        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub Total", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).accentColor,
                        )),
                        Text("0.0 USD",  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).accentColor,
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).accentColor,
                        )),
                        Text("Free", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).accentColor,
                        )),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle( fontSize: 18,  fontWeight: FontWeight.bold,  color: Theme.of(context).accentColor ),),
                        Text("\$85.00 USD", style: TextStyle( fontSize: 18,  fontWeight: FontWeight.bold, color: Theme.of(context).accentColor ),),
                      ]
                    ),
                    Spacer(),
                    DeliveryButton(
                      ontap: (){}, 
                      text: 'Checkout'
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),



      ],

    );

  }
}

class _ShoppingCartProduct extends StatelessWidget {

  final Product product;

  const _ShoppingCartProduct({required this.product});
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).canvasColor,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical:  10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
      
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipOval(
                          child: Image.asset(
                            product.image,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height:  8),

                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name),
                        const SizedBox(height:  15,),

                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: DeliveryColors.lightGrey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 15 ),
      
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: DeliveryColors.white,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Icon(Icons.remove, color: Colors.black,)
                                
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Text("2"),
                            ),
      
      
                            Container(
                              decoration: BoxDecoration(
                                color: DeliveryColors.purple,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Icon(Icons.add, color: Colors.white)
                                
                              ),
                            ),
                            Spacer(),
                            Text("\$${product.price}", style: TextStyle(color: DeliveryColors.green),),
                          ],
                        )
      
                        
                      ],
                    ),
                  ),
      
                ],
              ),
            ),
          ),
        
          Positioned(
            right: 0,
            child: InkWell(
              onTap: (){},
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete),
              ),
            )
          ),
        
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback goShopping;
  const _EmptyCart({super.key, required this.goShopping});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/sad.png', height: 80, color: DeliveryColors.green,),
        const SizedBox(height: 20,),
        Text("No hay productos", textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).disabledColor),),
        const SizedBox(height: 20,),
        Center(
          child: ElevatedButton(
            
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 50)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              backgroundColor: MaterialStatePropertyAll(DeliveryColors.purple)
            ) ,
            onPressed: goShopping, 
            child: const Text(
              'Ir a comprar'
            )
          )
        )
      ],
    );
  }
}