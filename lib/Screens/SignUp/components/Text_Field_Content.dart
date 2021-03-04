import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextFieldContent extends StatelessWidget {
  final double count;
  final Widget child;
  const TextFieldContent({
    Key key,
    @required this.count,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: size.height * 0.06,
      width: size.width * count,
      decoration: BoxDecoration(
        color: trzPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
