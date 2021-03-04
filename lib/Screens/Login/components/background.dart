import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //This provide us total height and width of the screen
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/images/logo.png",
                width: size.width,
              )),
          child
        ],
      ),
    );
  }
}
