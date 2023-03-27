import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/app/app.locator.dart';
import 'package:project/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

class loginservice extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool passwordwhow = true;

  passwordshowfunction() {
    if (passwordwhow == true) {
      passwordwhow = false;
    } else {
      passwordwhow = true;
    }
    rebuildUi();
  }

  navigatetoregsit() {
    _navigationService.navigateToServiceRegister();
  }

  CollectionReference userdata =
      FirebaseFirestore.instance.collection("usersdata");

  getallusersdata() async {
    return userdata.get();
  }

  getalldata() {
    FutureBuilder(
        future: getallusersdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  print(snapshot.data.docs[index]['name']);
                  return snapshot.data.docs[index]['name'];
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  loginuser(email, pass, type, context) async {
    try {
      SharedPreferences.setMockInitialValues({});
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      route(type, email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {}
    } catch (e) {
      print(e);
    }
  }

  route(type, email) async {
    User? user = FirebaseAuth.instance.currentUser;

    var kk = FirebaseFirestore.instance
        .collection('usersdata')
        .where('userid', isEqualTo: user!.uid) // specify the user ID here
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        // at least one document was found
        // we'll just use the first one here
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('type', type);

        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        if (documentSnapshot.get('type') == type && type == 'Police') {
          _navigationService.navigateToPolicerequests();
        } else {
          _navigationService.navigateToPolicerequests();
          // _navigationService.navigateToPolicerequests();
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
