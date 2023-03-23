import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class userrequest extends BaseViewModel {
  final navigationservice = locator<NavigationService>();

  navigatetohome() {
    navigationservice.navigateToUserhelp();
  }

  navigatetocuurentloc() {
    navigationservice.navigateToUsercurrentloc();
  }

  final user = FirebaseAuth.instance.currentUser!.uid;
}
