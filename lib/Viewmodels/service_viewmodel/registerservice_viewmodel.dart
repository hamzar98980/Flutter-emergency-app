import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class Serviceregistration extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  registeruser($email, $pass, $name, $phone, $type) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: $email,
        password: $pass,
      );

      CollectionReference usersdata =
          FirebaseFirestore.instance.collection('usersdata');
      usersdata
          .add({
            'userid': credential.user?.uid,
            'Name': $name,
            'email': $email,
            'phone': $phone,
            'type': $type
          })
          .then((value) => print("done"))
          .catchError((e) => print(e));

      _navigationService.navigateToServicelogin();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
