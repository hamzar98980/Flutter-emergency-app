import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class userrequest extends BaseViewModel {
  final navigationservice = locator<NavigationService>();

  navigatetohome() {
    navigationservice.navigateToUserhelp();
  }

  final user = FirebaseAuth.instance.currentUser!.uid;

  alluserrequest() async {
    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference userrequest =
        FirebaseFirestore.instance.collection("userhelp");

    QuerySnapshot userRequestsSnapshot = await FirebaseFirestore.instance
        .collection("userhelp")
        .where('userid', isEqualTo: user!.uid) // specify the user ID here
        .get();

    List<QueryDocumentSnapshot> userreq = userRequestsSnapshot.docs;

    if (userreq.isNotEmpty) {
      print('o k h a saab');
    } else {
      print('n o t o k  h a saab');
    }

    // return userreq;
    return userrequest.get();
  }
}
