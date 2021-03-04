import 'package:flutter/material.dart';

class RemainingStuffs extends StatelessWidget {
  final String image;
  final String stuffName;
  final int amount;
  final int score;
  const RemainingStuffs({
    Key key,
    @required this.image,
    @required this.stuffName,
    @required this.amount,
    @required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            height: size.height * .1,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    width: size.width * 0.12,
                    child: Image.asset(image)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stuffName,
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                    Text(
                      "Amount: $amount",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                    Text(
                      "Score: $score",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
