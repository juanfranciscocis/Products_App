

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/models.dart';

import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {

  //DATA MEMBERS
  final String _baseUrl = 'flutter-varios-c2766-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;
  Product? selectedProduct;

  File? newPictureFile;

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

  Future saveOrCreateProduct(Product product) async{
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      //necesario crear
      await this.createProduct(product);
    }else{
      //necesario actualizar
      await this.updateProduct(product);
      notifyListeners();

    }


    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async{

    final url = Uri.https(_baseUrl, "products/${product.id}.json");
    final response = await http.put(url, body: product.toJson());
    final decodedData = response.body;
    print(decodedData);

    //TODO: ACTUALIZAR LISTA DE PRODUCTOS
    final index = this.products.indexWhere((p) => p.id == product.id);
    this.products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async{

    final url = Uri.https(_baseUrl, "products.json");
    final response = await http.post(url, body: product.toJson());
    final decodedData = jsonDecode(response.body);
    print(decodedData);

    product.id = decodedData['name'];
    products.add(product);

    return product.id!;
  }

  void updateSelectedProductImage(String path){
    this.selectedProduct!.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
  
  Future<String?> uploadImage()async{
    
    if(this.newPictureFile == null){
      return null;
    }
    
    this.isSaving = true;
    notifyListeners();
    
    final url = Uri.parse('https://api.cloudinary.com/v1_1/juanfranciscocis/image/upload?upload_preset=ProductsApp');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', this.newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if(response.statusCode != 200 && response.statusCode != 201){
      print('Something Went Wrong');
      print(response.body);
      return null;
    }

    this.newPictureFile = null;

    final responseData = json.decode(response.body);


    return responseData['secure_url'];
    
  }
  









}