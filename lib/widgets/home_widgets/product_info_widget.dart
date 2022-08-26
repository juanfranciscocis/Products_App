
import 'package:flutter/material.dart';
import 'package:products_app/ui/input_decoration.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,

        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecorations.decoration(
                  labelText: 'Product Name', hintText: 'Enter Product Name', icon: Icons.add_business,
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.decoration(
                  labelText: 'Price', hintText: 'Enter Price', icon: Icons.currency_exchange,
                ),
              ),

              SizedBox(height: 20),

              SwitchListTile.adaptive(
                  value: true,
                  onChanged: (value) {},
                  title: Text('Available', style: TextStyle(fontSize: 18, color: Colors.deepPurple),)
              ),

              SizedBox(height: 20),
            ],
          ),

        ) ,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),

      ),
    );
  }
}