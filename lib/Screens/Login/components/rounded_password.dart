import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'text_field_container.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final validator;
  const PasswordField({
    Key key,
    this.onChanged,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: UserFieldContainer(
            child: TextFormField(
              validator: validator,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.lock,
                  color: trzPrimaryDarkColor,
                ),
                suffixIcon: Icon(Icons.visibility, color: trzPrimaryDarkColor),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: trzTextLight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
