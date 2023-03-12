import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class nearestlocation_services {
  LatLng currentlocation = LatLng(24.8607, 67.0011);

  Future<Position> getcurrentuserlocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) {
        print('error' + error.toString());
      },
    );
    return await Geolocator.getCurrentPosition();
  }
}
