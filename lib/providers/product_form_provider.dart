
import 'package:flutter/material.dart';
import 'package:products_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  updateAvailable(bool value) {
    product.available = value;
    notifyListeners();
  }




  bool isValidForm() {
    return formState.currentState?.validate() ?? false;
  }

}
