import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class userhelp_viewmodel extends BaseViewModel {
  final navigationservice = locator<NavigationService>();

  navigatetomap() {
    navigationservice.navigateToNearestloc();
  }

  navigatetopolice() {
    navigationservice.navigateToPolicmap();
  }

  navigatetorequest() {
    navigationservice.navigateToRequestuser();
  }
}
