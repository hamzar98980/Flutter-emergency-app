import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/app/app.locator.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

class loginservice extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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
            return CircularProgressIndicator();
          }
        });
  }

  loginuser(email, pass) async {
    try {
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      getalldata();
      // if (userSnapshot.exists) {
      //   // User is logged in as a user
      //   _navigationService.navigateToServicehome();
      // } else {
      //   // User is not logged in as a user
      //   print('no account found');
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print('Wrong Password.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
