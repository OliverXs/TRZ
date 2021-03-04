import 'package:flutter/material.dart';
import 'package:tkz/constants.dart';
import 'stuff_status.dart';
import 'top_menu_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.02,
            ),
            TopMenuBar(),
            StuffStatus(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: trzThird,
                        ),
                        width: (size.width / 2) - 10,
                        child: TextButton(
                            onPressed: () async {},
                            child: Text("Look for trading")),
                      ),
                      Container(
                          width: (size.width / 2) - 10,
                          decoration: BoxDecoration(
                            color: trzDarkColor,
                          ),
                          child: TextButton(
                              onPressed: () async {},
                              child: Text(
                                "Create a Trading",
                                style: TextStyle(color: trzPrimaryLightColor),
                              ))),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
