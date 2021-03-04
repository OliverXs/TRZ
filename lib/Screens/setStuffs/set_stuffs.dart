import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tkz/services/database/user.dart';
import 'components/body.dart';

class SetStuffs extends StatefulWidget {
  final TrzUser user;
  SetStuffs({this.user});

  @override
  _SetStuffsState createState() => _SetStuffsState(user: user);
}

class _SetStuffsState extends State<SetStuffs> {
  final TrzUser user;
  _SetStuffsState({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Body(
        user: user,
      ),
    );
  }
}
