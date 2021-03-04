import 'package:location/location.dart';

class Stuffs {
  int fijiWater;
  int campbellSoup;
  int firstAidPouch;
  int ak47;
}

class TrzUser {
  String userName = '';
  String userEmail = '';
  String userGender = '';
  String userAge = '';
  String userPassword;
  Stuffs stuffs = Stuffs();
  LocationData currentPosition;
  String userUid;

  TrzUser({this.userUid});
}
