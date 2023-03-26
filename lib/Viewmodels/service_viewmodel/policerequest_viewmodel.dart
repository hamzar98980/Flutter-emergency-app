import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

// ignore: camel_case_types
class police_request extends BaseViewModel {
  // Future<Stream<QuerySnapshot<Object?>>> getalldata() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('email'));
  //   var usertype = prefs.getString('type');

  //   return FirebaseFirestore.instance
  //       .collection('userhelp')
  //       .where('servicetype', isEqualTo: usertype)
  //       .snapshots();
  // }

  Stream<QuerySnapshot> getalldata() async* {
    final prefs = await SharedPreferences.getInstance();
    var usertype = prefs.getString('type');

    yield* FirebaseFirestore.instance
        .collection('userhelp')
        .where('servicetype', isEqualTo: usertype)
        .snapshots();
  }

  getsharedpreferences() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('email'));
    print(prefs.getString('type'));
    // print(prefs.remove('email'));
    // print(prefs.getString('email'));
  }
}
