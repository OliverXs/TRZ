//I can see that "maybe"  there are a lot of SOLID leakes here.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tkz/services/database/user.dart';
import '../../../constants.dart';
import 'Text_Field_Content.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as getLocal;
import '../../setStuffs/set_stuffs.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TrzUser user = TrzUser();
  String currentAddress = "Get Location";
  bool getLocation = false;

  //Key for Register validation.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFieldContent(
                count: 0.87,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (val) => val.isEmpty ? 'Enter your name' : null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: trzTextLight,
                      ),
                      contentPadding: EdgeInsets.only(left: 10)),
                  onChanged: (val) {
                    setState(() => user.userName = val);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFieldContent(
                count: 0.87,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (val) =>
                      val.isEmpty ? 'Enter a valid email' : null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: trzTextLight,
                      ),
                      contentPadding: EdgeInsets.only(left: 10)),
                  onChanged: (val) {
                    setState(() => user.userEmail = val);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFieldContent(
                count: 0.4,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),

                  //THAT SHOULD BE A RATIO BUTTON, BUT I DIDN'T YET.
                  validator: (val) => val.isEmpty ? 'Select your gender' : null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Gender",
                      hintStyle: TextStyle(
                        color: trzTextLight,
                      ),
                      contentPadding: EdgeInsets.only(left: 10)),
                  onChanged: (val) {
                    setState(() => user.userGender = val);
                  },
                ),
              ),
              TextFieldContent(
                count: 0.4,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  validator: (val) =>
                      (int.parse(val) < 18 || int.parse(val) > 80)
                          ? 'Enter a valid age'
                          : null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Age",
                      hintStyle: TextStyle(
                        color: trzTextLight,
                      ),
                      contentPadding: EdgeInsets.only(left: 10)),
                  onChanged: (val) {
                    setState(() => user.userAge = val);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFieldContent(
                count: 0.87,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (val) => val.length < 6
                      ? 'Enter a password with at leasts 6 characters'
                      : null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: trzTextLight,
                      ),
                      contentPadding: EdgeInsets.only(left: 10)),
                  onChanged: (val) {
                    setState(() => user.userPassword = val);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                minWidth: size.width * 0.87,
                height: size.height * 0.06,
                color: trzPrimaryDarkColor,
                onPressed: () => {
                  setState(() {
                    getCurrentLocation();
                  }),
                },
                child: Text(
                  currentAddress,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  minWidth: size.width * .50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: trzPrimaryDarkColor,
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate() &&
                        user.currentPosition != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetStuffs(
                                  user: user,
                                )),
                      );
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }

  getCurrentLocation() async {
    getLocal.Location location = new getLocal.Location();
    bool _serviceEnabled;
    getLocal.PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == getLocal.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != getLocal.PermissionStatus.granted) {
        return;
      }
    }

    user.currentPosition = await location.getLocation();

    getCurrentAddress(user.currentPosition);
  }

  getCurrentAddress(getLocal.LocationData currentLocation) async {
    List<Placemark> placemark = await placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);
    Placemark place = placemark[0];

    String address = "${place.administrativeArea}, ${place.country}";
    setState(() {
      currentAddress = address;
    });
  }
}
