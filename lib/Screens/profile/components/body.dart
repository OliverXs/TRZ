import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tkz/Screens/profile/components/text_field_content.dart';
import 'package:tkz/Screens/profile/components/text_form_content.dart';
import 'package:tkz/services/database/trade.dart';
import 'package:tkz/services/database/database.dart' as dbService;
import '../../../constants.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = '';

  returnCurrentUserID(String uid) {
    final User userLogged = _auth.currentUser;
    uid = userLogged.uid;
    return uid;
  }

  Trade trader = Trade();
  Trade trading = Trade();

  Future<void> setTrading(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.zero,
            backgroundColor: trzBackgroundColor,
            content: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "What I want",
                      style: TextStyle(color: trzPrimaryLightColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(
                                () => trader.take.fijiWater = int.parse(val));
                          },
                          hintText: "Fiji Water",
                        )),
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(() =>
                                trader.take.campbellSoup = int.parse(val));
                          },
                          hintText: "Campbell Soup",
                        )),
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(() =>
                                trader.take.firstAidPouch = int.parse(val));
                          },
                          hintText: "First Aid Pouch",
                        )),
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(() => trader.take.ak47 = int.parse(val));
                          },
                          hintText: "AK47",
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "In exchange",
                      style: TextStyle(color: trzPrimaryLightColor),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(
                                () => trader.give.fijiWater = int.parse(val));
                          },
                          hintText: "Fiji Water",
                        )),
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(() =>
                                trader.give.campbellSoup = int.parse(val));
                          },
                          hintText: "Campbell Soup",
                        )),
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(() =>
                                trader.give.firstAidPouch = int.parse(val));
                          },
                          hintText: "First Aid Pouch",
                        )),
                        TextFieldContainer(
                            child: TextFormContent(
                          onChanged: (val) async {
                            setState(() => trader.give.ak47 = int.parse(val));
                          },
                          hintText: "AK47",
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    uid = await returnCurrentUserID(uid);
                    dynamic result = await dbService.DatabaseService()
                        .createTrading(uid, trader.give, trader.take);
                    Navigator.of(context).pop();
                  },
                  child: Text("Confirm"))
            ],
          );
        });
  }

  Future<void> lookForTrade(BuildContext context, Trade trading) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.zero,
            backgroundColor: trzBackgroundColor,
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "Request",
                    style: TextStyle(color: trzPrimaryLightColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFieldContainer(
                          child: Text(
                        "Fiji Water: ${trading.take.fijiWater}",
                        style: TextStyle(color: Colors.white),
                      )),
                      TextFieldContainer(
                          child: Text(
                        "Campbell Soup: ${trading.take.campbellSoup}",
                        style: TextStyle(color: Colors.white),
                      )),
                      TextFieldContainer(
                          child: Text(
                        "First Aid Pouch: ${trading.take.firstAidPouch}",
                        style: TextStyle(color: Colors.white),
                      )),
                      TextFieldContainer(
                          child: Text(
                        "Ak47: ${trading.take.ak47}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "In exchange",
                    style: TextStyle(color: trzPrimaryLightColor),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFieldContainer(
                          child: Text(
                        "Fiji Water: ${trading.give.fijiWater}",
                        style: TextStyle(color: Colors.white),
                      )),
                      TextFieldContainer(
                          child: Text(
                        "Campbell Soup: ${trading.give.campbellSoup}",
                        style: TextStyle(color: Colors.white),
                      )),
                      TextFieldContainer(
                          child: Text(
                        "First Aid Pouch: ${trading.give.firstAidPouch}",
                        style: TextStyle(color: Colors.white),
                      )),
                      TextFieldContainer(
                          child: Text(
                        "Ak47: ${trading.give.ak47}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Text("Confirm"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.only(top: 23),
          height: size.height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
              color: trzSecondary, borderRadius: BorderRadius.circular(10)),
          child: Image.asset("assets/images/fair-trade.png"),
        ),
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: trzThird,
                ),
                width: size.width / 2,
                child: TextButton(
                    onPressed: () async {
                      await dbService.DatabaseService()
                          .getTradeDoc(trading)
                          .then((trading) {
                        lookForTrade(context, trading);
                      });
                    },
                    child: Text("Look for trading"))),
            Container(
                width: size.width / 2,
                decoration: BoxDecoration(
                  color: trzDarkColor,
                ),
                child: TextButton(
                    onPressed: () async {
                      setTrading(context);
                    },
                    child: Text(
                      "Create a Trading",
                      style: TextStyle(color: trzPrimaryLightColor),
                    ))),
          ],
        ),
      ]),
    );
  }
}
