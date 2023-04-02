import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/app/app.locator.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class userlocation extends BaseViewModel {
  final List<Marker> markerlist = <Marker>[];
  final navigationservice = locator<NavigationService>();

  navigatetohome() {
    navigationservice.navigateToUserhelp();
  }

  navigatetorequest() {
    navigationservice.navigateToRequestuser();
  }

  Future<Position> getcurrentuserlocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) {
        print('error$error');
      },
    );
    return await Geolocator.getCurrentPosition();
  }

  final Completer<GoogleMapController> mycontroller = Completer();
  LatLng currentlocation = const LatLng(24.8607, 67.0011);

  getcurrentlocationuser() async {
    getcurrentuserlocation().then((value) async {
      LatLng currentlocation = LatLng(value.latitude, value.longitude);
      markerlist.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: const InfoWindow(title: 'Current Location'),
      ));

      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 15);

      final GoogleMapController controller = await mycontroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      rebuildUi();
    });
  }
}
