// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {

  //DATA MEMBERS
  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  //CONSTRUCTOR
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
  });


//CONVERT FROM MAP
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));
//CONVERT TO MAP
  String toJson() => json.encode(toMap());
//CONVERT FROM MAP
  factory Product.fromMap(Map<String, dynamic> json) => Product(
    available: json["available"],
    name: json["name"],
    picture: json["picture"],
    price: json["price"].toDouble(),
  );
//CONVERT TO MAP
  Map<String, dynamic> toMap() => {
    "available": available,
    "name": name,
    "picture": picture,
    "price": price,
  };
}
