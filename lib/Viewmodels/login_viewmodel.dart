import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/app/app.locator.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class Login_viewmodel extends BaseViewModel {
  final Navigationservice = locator<NavigationService>();

  navigatetoregister() {
    Navigationservice.navigateToRegister();
  }

  loginuser(email, pass) async {
    try {
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      Navigationservice.navigateToUserhelp();
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
