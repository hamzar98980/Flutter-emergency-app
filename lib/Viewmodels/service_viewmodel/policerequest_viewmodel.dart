import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

// ignore: camel_case_types
class police_request extends BaseViewModel {
  Stream<QuerySnapshot> getalldata() async* {
    final prefs = await SharedPreferences.getInstance();
    var usertype = prefs.getString('type');

    yield* FirebaseFirestore.instance
        .collection('userhelp')
        .where('servicetype', isEqualTo: usertype)
        .snapshots();
  }

  Stream<QuerySnapshot> getalluserdata(userid) {
    return FirebaseFirestore.instance
        .collection('usersdata')
        .where('userid', isEqualTo: userid)
        .snapshots();
  }

  getsharedpreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('type');
    return type;
    // print(preftypes.remove('email'));
    // print(prefs.getString('email'));
  }
}
