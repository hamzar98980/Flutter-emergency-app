import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

// ignore: camel_case_types
class police_request extends BaseViewModel {
  Future<void> getData() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('userhelp')
        .where('type', isEqualTo: 'Police')
        .get();

    for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
        in snapshot.docs) {
      final data = doc.data();
      // Do something with the data...
      print(data['servicename']);
    }
  }

  getsharedpreferences() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('email'));
    print(prefs.getString('type'));
    // print(prefs.remove('email'));
    // print(prefs.getString('email'));
  }
}
