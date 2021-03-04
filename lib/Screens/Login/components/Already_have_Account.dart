import 'package:flutter/material.dart';
import '../../../constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? "Don't have an Account and still alive ?"
              : "Already have an Account ?",
          style: TextStyle(color: trzText, fontSize: 16),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Sign Up!" : "Sign In",
            style: TextStyle(
                color: trzPrimaryLightColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
