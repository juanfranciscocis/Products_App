import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';
import '../../services/product_service.dart';

class ProductCardWidget extends StatelessWidget{

  final List<Product> products;
  final int index;

  const ProductCardWidget({Key? key,required this.products, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 400,
        //color: Colors.red,
        decoration: cardDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children:[

            _BackgroundCardImage(index: index, products: products),

            _ProductDetails(index: index, products: products,),

            Positioned(
              top: 0,
              right: 0,
                child: _PriceTag(index: index, products: products,)
            ),


            Positioned(
              top: 0,
                child: _NotAvailable(index: index, products: products)
            )




          ]
        ),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      );
  }
}

class _NotAvailable extends StatelessWidget {

  final int index;
  final List<Product> products;


  const _NotAvailable({
    Key? key, required this.index, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(products[index].available == false){
      return Container();
    }

    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('NOT AVAILABLE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
        ),
      ),
      width: 150,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {

  final int index;
  final List<Product> products;


  const _PriceTag({
    Key? key, required this.index, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text( '\$${products[index].price}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {

  final List<Product> products;
  final int index;

  const _ProductDetails({
    Key? key, required this.products, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(right:50),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple[400]!,
              Colors.deepPurple,
            ],
          ),
        ),
          width: double.infinity,
          height: 70,
          //color: Colors.purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 30),
                Text(this.products[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
              ],

            ),

            Row(
              children: [
                SizedBox(width: 30),
                Text(this.products[index].id.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
              ],
            ),

          ],
        )
      ),
    );
  }
}

class _BackgroundCardImage extends StatelessWidget {

  final int index;
  final List<Product> products;

  const _BackgroundCardImage({
    Key? key, required this.index, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String? url = products[index].picture;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.red,
        child:
            url == null ? Image(
              image: AssetImage('assets/no-image.png'),
              fit: BoxFit.cover,
            ) : FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      )
    );
  }
}