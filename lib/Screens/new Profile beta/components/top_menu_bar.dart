import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tkz/constants.dart';

class TopMenuBar extends StatelessWidget {
  final String name;
  final String locale;
  const TopMenuBar({
    Key key,
    @required this.name,
    @required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                LineAwesomeIcons.arrow_left,
                size: size.height * .05,
                color: Colors.white,
              ),
              Icon(
                LineAwesomeIcons.sun,
                size: size.height * .05,
                color: Colors.white,
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: size.width * 0.1,
                  backgroundImage: AssetImage("assets/images/living-dead.png"),
                ),
                Container(
                  width: size.width * 0.22,
                  height: size.height * .11,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: size.width * 0.08,
                    width: size.width * 0.12,
                    decoration: BoxDecoration(
                        color: trzDarkColor, shape: BoxShape.circle),
                    child: Icon(
                      LineAwesomeIcons.pen,
                      size: size.width * 0.05,
                      color: trzPrimaryLightColor,
                    ),
                  ),
                )
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$name",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$locale",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
