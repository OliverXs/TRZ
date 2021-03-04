import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'text_field_container.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final validator;
  const RoundedInput({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserFieldContainer(
        child: TextFormField(
      validator: validator,
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
          icon: Icon(icon, color: trzPrimaryDarkColor),
          hintText: hintText,
          hintStyle: TextStyle(
            color: trzTextLight,
          ),
          border: InputBorder.none),
    ));
  }
}
