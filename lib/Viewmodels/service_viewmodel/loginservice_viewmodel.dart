import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/app/app.locator.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

class loginservice extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatetoregsit() {
    _navigationService.navigateToServiceRegister();
  }

  loginuser(email, pass) async {
    try {
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      // DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(Credential.user?.uid)
      //     .get();

      // if (userSnapshot.exists) {
      // print(userSnapshot);
      // User is logged in as a user
      _navigationService.navigateToServicehome();
      // } else {
      // User is not logged in as a user
      // print('no account found');
      // _showErrorDialog('Invalid credentials');
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
