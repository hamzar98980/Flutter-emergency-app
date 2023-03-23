import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class nearestlocation_services {
  LatLng currentlocation = const LatLng(24.8607, 67.0011);

  final Completer<GoogleMapController> mycontroller = Completer();
  final List<Marker> marker_list = <Marker>[];

  Future<Position> getcurrentuserlocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) {
        print('error$error');
      },
    );
    return await Geolocator.getCurrentPosition();
  }

  getcurrentlocationuser() async {
    getcurrentuserlocation().then((value) async {
      LatLng currentlocation = LatLng(value.latitude, value.longitude);
      marker_list.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: const InfoWindow(title: 'Current Location'),
      ));
      CameraPosition cameraPosition =
          CameraPosition(target: LatLng(value.latitude, value.longitude));

      final GoogleMapController controller = await mycontroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }
}
