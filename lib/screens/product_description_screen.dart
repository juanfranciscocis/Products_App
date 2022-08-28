import 'package:flutter/material.dart';
import 'package:products_app/providers/product_form_provider.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../widgets/widgets.dart';

class ProductDescriptionScreen extends StatelessWidget{
  const ProductDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct!),
    child: _ProductBody(productsService: productsService,));
    //return _ProductBody(productsService: productsService);
  }
}

class _ProductBody extends StatelessWidget {
  const _ProductBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  ProductImageWidget(url: productsService.selectedProduct!.picture,),
                  Positioned(
                    top: 0,
                    left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80, left: 35),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                              icon: Icon(Icons.arrow_back, color: Colors.deepPurple, size: 30)
                          )
                      ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 80, right: 35),
                        child: IconButton(
                            onPressed: () {
                              //TODO: LAUNCH CAMERA
                            },
                            icon: Icon(Icons.camera_alt, color: Colors.deepPurple, size: 30)
                        )
                    ),
                  ),

                ],
              ),
            ),
            ProductInfoWidget(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt, color: Colors.white, size: 30),
        onPressed: () async {
          if(!productFormProvider.isValidForm()){
            return;
          }else{
            await productsService.saveOrCreateProduct(productFormProvider.product);
          }


        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked


    );
  }
}



