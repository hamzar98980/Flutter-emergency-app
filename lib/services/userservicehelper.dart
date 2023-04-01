import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userservicehelp {
  userhelper(servicename, servicetype) {
    final user = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;

    CollectionReference userhelp =
        FirebaseFirestore.instance.collection('userhelp');
    String docId = userhelp.doc().id; //
    userhelp
        .doc(docId)
        .set({
          'userid': user,
          'email': email,
          'servicename': servicename,
          'servicetype': servicetype,
          'status': '1',
          'docId': docId,
        })
        .then((value) => print("done"))
        .catchError((e) => print(e));
  }
}
