import 'package:flutter/material.dart';
import 'package:tkz/Screens/SignUp/components/background.dart';
import '../../../constants.dart';
import 'register_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/images/logo.png",
                width: size.width,
              )),
          Divider(
            height: 40,
            indent: 40,
            endIndent: 40,
            color: trzPrimaryLightColor,
          ),
          Text("Register to start the apocalyptic trade",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: trzPrimaryDarkColor)),
          SizedBox(
            height: 40,
          ),
          RegisterForm(),
        ],
      ),
    );
  }
}
