import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class nearest_viewmodel extends BaseViewModel {
  LatLng currentlocation = LatLng(25.1193, 55.37773);
  // LatLng currentlocation = LatLng(24.9266042, 67.0305398);

  Future<Position> getcurrentuserlocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) {
        print('error' + error.toString());
      },
    );
    return await Geolocator.getCurrentPosition();
  }

  getcurrentlocationuser() {
    getcurrentuserlocation().then((value) {
      LatLng currentlocation = LatLng(value.latitude, value.longitude);
      rebuildUi();

      print(value.latitude.toString() + ': lon ' + value.longitude.toString());
    });
  }
}
