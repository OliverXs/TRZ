import 'package:flutter/material.dart';
import 'package:tkz/Screens/Login/login_screen.dart';
import 'package:tkz/Screens/profile/profile_screen.dart';
import 'package:tkz/Screens/setStuffs/components/background.dart';
import 'package:tkz/Screens/setStuffs/components/text_field_container.dart';
import 'package:tkz/Screens/setStuffs/components/text_form_content.dart';
import 'package:tkz/constants.dart';
import 'package:tkz/services/auth/auth.dart';
import 'package:tkz/services/database/user.dart';

class Body extends StatefulWidget {
  final TrzUser user;
  Body({this.user});

  @override
  _BodyState createState() => _BodyState(user: user);
}

class _BodyState extends State<Body> {
  final AuthService _authService = AuthService();
  TrzUser user;
  final _formKey = GlobalKey<FormState>();

  _BodyState({this.user});

  @override
  Widget build(BuildContext context) {
    print("${user.currentPosition}");
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Positioned(
          top: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "You're almost there!!! Don't be afraid of the trader's fire",
                style: TextStyle(color: trzPrimaryLightColor),
              )
            ],
          ),
        ),
        Text(
          "Enter how many items you have of each below",
          style: TextStyle(color: trzPrimaryLightColor),
        ),
        SizedBox(
          height: 20,
        ),
        TextFieldContainer(
          child: TextFormContent(
            onChanged: (value) {
              setState(() => user.stuffs.fijiWater = int.parse(value));
            },
            image: "assets/images/drink-water.png",
            hintText: "  Fiji Water",
          ),
        ),
        TextFieldContainer(
            child: TextFormContent(
          onChanged: (value) {
            setState(() => user.stuffs.campbellSoup = int.parse(value));
          },
          image: "assets/images/can.png",
          hintText: "  Campbell Soup",
        )),
        TextFieldContainer(
            child: TextFormContent(
          onChanged: (value) {
            setState(() => user.stuffs.firstAidPouch = int.parse(value));
          },
          image: "assets/images/first-aid-kit.png",
          hintText: "  First Aid Pouch",
        )),
        TextFieldContainer(
            child: TextFormContent(
          onChanged: (value) {
            setState(() => user.stuffs.ak47 = int.parse(value));
          },
          image: "assets/images/sniper-rifle.png",
          hintText: "  AK47",
        )),
        TextButton(
          onPressed: () async {
            dynamic result =
                await _authService.registerWithEmailAndPassword(user);
            if (result == null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScrean()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            }
          },
          child: Text("Sign Up"),
        )
      ],
    ));
  }
}
