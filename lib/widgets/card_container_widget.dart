
import 'package:flutter/material.dart';

class CardContainerWidget extends StatelessWidget {

  final Widget child;

  const CardContainerWidget({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        //height: 350,
        //color: Colors.red,
        padding: const EdgeInsets.all(30),
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 5,
        ),
      ],


    );
  }
}