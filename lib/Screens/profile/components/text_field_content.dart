import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(left: 20),
      width: size.width,
      decoration: BoxDecoration(
          color: trzPrimary, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
