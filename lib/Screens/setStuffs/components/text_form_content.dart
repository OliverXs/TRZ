import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class TextFormContent extends StatelessWidget {
  final String image;
  final String hintText;
  final ValueChanged<String> onChanged;
  final validator;
  const TextFormContent({
    Key key,
    this.validator,
    @required this.image,
    @required this.hintText,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
        validator: validator,
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: EdgeInsets.only(right: 5),
            child: Image.asset(
              image,
              height: size.width * 0.02,
            ),
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: trzTextLight),
        ));
  }
}
