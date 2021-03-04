import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tkz/services/database/trade.dart';
import 'user.dart';

class DatabaseService {
  String uid;
  var tradeDocs;
  var dataDocuments;
  DatabaseService({this.uid});

  final CollectionReference userCollections =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference tradeCollections =
      FirebaseFirestore.instance.collection('Trades');

  Future getUserData(TrzUser userLogged) async {
    QuerySnapshot querySnapshot = await userCollections.get();
    querySnapshot.docs.forEach((result) {
      userLogged.userName = result.data()['Name'];
      userLogged.userAge = result.data()['Age'];
      userLogged.userGender = result.data()['Gender'];
    });

    return userLogged;
  }

  Future getTradeDoc(Trade tradeUser) async {
    QuerySnapshot querySnapshot = await tradeCollections.get();
    querySnapshot.docs.forEach((result) {
      tradeUser.give.ak47 = result.data()['In exchange Ak47'];
      tradeUser.give.fijiWater = result.data()['In exchange Fiji Water'];
      tradeUser.give.campbellSoup = result.data()['In exchange Campbell Soup'];
      tradeUser.give.firstAidPouch =
          result.data()['In exchange First Aid Pouch'];
      tradeUser.take.ak47 = result.data()['Requested Ak47'];
      tradeUser.take.fijiWater = result.data()['Requested Fiji Water'];
      tradeUser.take.campbellSoup = result.data()['Requested Campbell Soup'];
      tradeUser.take.firstAidPouch = result.data()['Requested First Aid Pouch'];
    });
    return tradeUser;
  }

  Future setUserAttribute(TrzUser user) async {
    return await userCollections.doc(uid).set({
      'Name': user.userName,
      'Age': user.userAge,
      'Gender': user.userGender,
      'Latitude': user.currentPosition.latitude,
      'Longitude': user.currentPosition.longitude,
      'AK47': user.stuffs.ak47,
      'CampbellSoup': user.stuffs.campbellSoup,
      'FijiWater': user.stuffs.fijiWater,
      'FirstAidPouch': user.stuffs.firstAidPouch,
    });
  }

  Future createTrading(String uid, ToGive give, ToTake take) async {
    return await tradeCollections.doc(uid).set({
      'User Id': uid,
      'Requested Ak47': take.ak47,
      'Requested Fiji Water': take.fijiWater,
      'Requested Campbell Soup': take.campbellSoup,
      'Requested First Aid Pouch': take.firstAidPouch,
      'In exchange Ak47': give.ak47,
      'In exchange Fiji Water': give.fijiWater,
      'In exchange Campbell Soup': give.campbellSoup,
      'In exchange First Aid Pouch': give.firstAidPouch,
    });
  }
}
