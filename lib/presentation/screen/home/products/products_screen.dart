import 'package:delivery/data/in_memory_products.dart';
import 'package:delivery/domain/models/product.dart';
import 'package:delivery/presentation/theme/theme.dart';
import 'package:delivery/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';


class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Inicio"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ), 
        
        itemCount: products.length,
        itemBuilder: (context, i) {
          final product = products[i];
          return _ItemProduct(
            product: product,
          );
        },
      )
    );
  }
} 


class _ItemProduct extends StatelessWidget {
  _ItemProduct({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ClipOval(
                    child: Image.asset(
                      product.image,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(product.name),

                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: DeliveryColors.lightGrey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5 ),

                  Text("\$${product.price} USD"),
                ],
              ),
            ),

            DeliveryButton(
              padding: const EdgeInsets.symmetric(vertical: 4),
              text: "Añadir",
              ontap: (){},
            ),

            // DeliveryButton(
            //   padding: EdgeInsets.all(4),
            //   text: "Añadir",
            //   ontap: (){},
            // )
          ],
        ),
      ),
    );
  }
}