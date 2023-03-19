import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class userrequest extends BaseViewModel {
  final navigationservice = locator<NavigationService>();

  navigatetohome() {
    navigationservice.navigateToUserhelp();
  }

  alluserrequest() async {
    CollectionReference userrequest =
        FirebaseFirestore.instance.collection("userhelp");
    return userrequest.get();
  }
}
