import 'package:flutter/material.dart';
import 'components/body.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Body(),
    );
  }
}
