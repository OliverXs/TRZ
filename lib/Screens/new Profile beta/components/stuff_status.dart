import 'package:flutter/material.dart';

import 'remaining_stuffs.dart';

class StuffStatus extends StatelessWidget {
  const StuffStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      color: Colors.white,
      child: Column(
        children: [
          RemainingStuffs(
            image: "assets/images/drink-water.png",
            stuffName: "Water Bottle",
            score: 5,
            amount: 10,
          ),
          RemainingStuffs(
              image: "assets/images/can.png",
              stuffName: "Soup",
              amount: 4,
              score: 5),
          RemainingStuffs(
              image: "assets/images/first-aid-kit.png",
              stuffName: "First aid kit",
              amount: 2,
              score: 3),
          RemainingStuffs(
              image: "assets/images/sniper-rifle.png",
              stuffName: "AK47",
              amount: 1,
              score: 50),
        ],
      ),
    );
  }
}
