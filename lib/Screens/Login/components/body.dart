import 'package:flutter/material.dart';
import 'package:tkz/Screens/Login/components/background.dart';
import 'package:tkz/Screens/Login/components/rounded_button.dart';
import 'package:tkz/Screens/Login/components/rounded_password.dart';
import 'package:tkz/Screens/SignUp/signup_screen.dart';
import 'package:tkz/Screens/profile/profile_screen.dart';
import 'package:tkz/services/auth/auth.dart';
import 'package:tkz/services/database/user.dart';
import '../../../constants.dart';
import 'Already_have_Account.dart';
import 'rounded_input.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TrzUser user = TrzUser();
  final AuthService _authService = AuthService();
  final _loginKey = GlobalKey<FormState>();
  Color color = Colors.white70;
  String info =
      "If you lose your password or your device, we will treat you as dead, sending your last location to other survivors. Welcome to the hunger games.";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: Container(
      alignment: Alignment.center,
      child: Form(
        key: _loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInput(
                hintText: "Your user Email",
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                onChanged: (value) {
                  setState(() {
                    user.userEmail = value;
                  });
                }),
            SizedBox(height: size.height * 0.015),
            PasswordField(
              hintText: "Password",
              validator: (val) => val.isEmpty ? 'Enter your Password' : null,
              onChanged: (value) async {
                setState(() {
                  user.userPassword = value;
                });
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if (_loginKey.currentState.validate()) {
                  dynamic result =
                      await _authService.signInWithEmailAndPassword(
                          user.userEmail, user.userPassword);
                  if (result == null) {
                    setState(() {
                      info = "could not sign in";
                      color = trzPrimaryLightColor;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserProfile()),
                    );
                  }
                }
              },
            ),
            SizedBox(height: size.height * 0.015),
            Container(
              width: size.width * 0.8,
              child: Text(
                info,
                style: TextStyle(color: color, fontSize: 12),
                textAlign: TextAlign.justify,
              ),
            ),
            Divider(
              height: 40,
              indent: 40,
              endIndent: 40,
              color: trzPrimaryLightColor,
            ),
            AlreadyHaveAnAccount(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            })
          ],
        ),
      ),
    ));
  }
}
