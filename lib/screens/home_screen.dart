
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';
import 'loading_screen.dart';

class HomeScreen extends StatelessWidget{



  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    if(productsService.isLoading == true){
      return const LoadingScreen();
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        leading:
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/userInfo');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/person.png'),
              ),
            ),
          ),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                productsService.selectedProduct = productsService.products[index].copy(); //copy the product
                Navigator.pushNamed(context, '/description');
              },
                child: ProductCardWidget(products: productsService.products, index: index),

            );
          }
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            
            productsService.selectedProduct = Product(price: 0.0, available: true, name: '');
            Navigator.pushNamed(context, '/description');

          },
        ),
    );
  }
}