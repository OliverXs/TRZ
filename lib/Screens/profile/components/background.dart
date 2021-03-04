import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(),
      child: Stack(
        children: <Widget>[
          child,
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/living-dead.png",
                width: size.width * .5,
              ))
        ],
      ),
    );
  }
}
