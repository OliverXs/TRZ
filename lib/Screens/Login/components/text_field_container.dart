import 'package:flutter/material.dart';
import '../../../constants.dart';

class UserFieldContainer extends StatelessWidget {
  final Widget child;
  const UserFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: trzPrimary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
