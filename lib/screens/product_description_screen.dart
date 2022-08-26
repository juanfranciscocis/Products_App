import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProductDescriptionScreen extends StatelessWidget{
  const ProductDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  ProductImageWidget(),
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
        onPressed: () {

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked


    );
  }
}



