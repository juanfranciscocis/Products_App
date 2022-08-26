import 'package:flutter/material.dart';

class LoginBackgroundWidget extends StatelessWidget{

  final Widget child;

  const LoginBackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),

          _TopIcon(),

          this.child,



        ],
      ),



    );
  }
}

class _TopIcon extends StatelessWidget {
  const _TopIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 200,
        //margin: const EdgeInsets.only(top: 20),
        //color: Colors.white,
        child: Icon(Icons.person, size: 100, color: Colors.white) ,
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      ),
      child: Stack(
        children: const [
          Positioned(
              child: _Bubble(),
            top:50,
            left: 23,
          ),
          Positioned(
            child: _Bubble(),
            top:250,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            top:182,
            left: 220,
          ),
          Positioned(
            child: _Bubble(),
            top:90,
            left: 130,
          ),
          Positioned(
            child: _Bubble(),
            top:10,
            left: 280,
          )
        ]
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:90,
      height:90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}