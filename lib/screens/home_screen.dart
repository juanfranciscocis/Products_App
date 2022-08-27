import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/description');
              },
                child: ProductCardWidget(products: productsService.products, index: index),

            );
          }
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {

          },
        ),
    );
  }
}