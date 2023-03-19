import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userservicehelp {
  userhelper(servicename, servicetype) {
    final user = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;

    CollectionReference userhelp =
        FirebaseFirestore.instance.collection('userhelp');
    userhelp
        .add({
          'userid': user,
          'email': email,
          'servicename': servicename,
          'servicetype': servicetype,
        })
        .then((value) => print("done"))
        .catchError((e) => print(e));
  }
}
