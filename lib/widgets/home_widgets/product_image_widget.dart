
import 'dart:io';

import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {

  final String? url;

  const ProductImageWidget({
    Key? key, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url);
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: 350,
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
          child: ClipRRect(
            borderRadius:  BorderRadius.all(Radius.circular(30)),
            child: getImage(url),
          )
        ),

      ),
    );
  }



  Widget getImage (String? picture){
    print(picture);

    if(picture == null) {
      print('nuloooo');
      return Image(
        image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
      );
    }
    if(picture.startsWith('http')){
      print('http');
      return  FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(url!),
        fit: BoxFit.cover,
      );
    }

    print('local');
    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }

}

