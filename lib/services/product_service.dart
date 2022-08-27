

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/models.dart';

import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {

  //DATA MEMBERS
  final String _baseUrl = 'flutter-varios-c2766-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProductsService(){
    loadProducts();
  }

  Future<List<Product>> loadProducts() async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "products.json");
    final response = await http.get(url);

    final Map<String,dynamic> productsMap = json.decode(response.body);

    productsMap.forEach((key, value){
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }



}