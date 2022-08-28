
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/ui/input_decoration.dart';
import 'package:provider/provider.dart';

import '../../providers/product_form_provider.dart';

class ProductInfoWidget extends StatelessWidget {



  const ProductInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final product = productFormProvider.product;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,

        child: Form(
          key: productFormProvider.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                initialValue: product.name,
                onChanged: (value){
                  product.name = value;
                },
                validator: (value){
                  if(value == null || value.length < 1){
                    return 'Please enter a valid name';
                  }
                },
                decoration: InputDecorations.decoration(
                  labelText: 'Product Name', hintText: 'Enter Product Name', icon: Icons.add_business,
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))//only allow numbers and 2 decimal places
                ],
                initialValue: product.price.toString(),
                onChanged: (value){
                  if(double.tryParse(value) == null){
                    product.price = 0.0;
                  }else {
                    product.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.decoration(
                  labelText: 'Price', hintText: 'Enter Price', icon: Icons.currency_exchange,
                ),
              ),

              SizedBox(height: 20),

              SwitchListTile.adaptive(
                  value: product.available,
                  onChanged: (value) {
                    productFormProvider.updateAvailable(value);

                  },
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