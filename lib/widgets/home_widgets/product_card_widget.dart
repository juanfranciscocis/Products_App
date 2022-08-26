import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget{
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.red,
      ),
    );
  }
}