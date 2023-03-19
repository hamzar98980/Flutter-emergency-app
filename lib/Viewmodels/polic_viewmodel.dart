import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/services/nearestlocation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

import '../View/components/alertbox.dart';
import '../app/app.locator.dart';
import '../services/userservicehelper.dart';

class policviewmodel extends BaseViewModel {
  final nearestloc_services = locator<nearestlocation_services>();
  final userhelp = userservicehelp();

  polichelp(servicename, servicetype) {
    userhelp.userhelper(servicename, servicetype);
  }

  getnearmarker(type, lati, longitude) async {
    String apiKey = 'AIzaSyDT3LscTu25eNfJ2E_OBoogEIgHbh8oTvY';
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lati},${longitude}&radius=5500&type=$type&key=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> results = data['results'];

      for (var result in results) {
        var name = result['name'];
        var lat = result['geometry']['location']['lat'];
        var lng = result['geometry']['location']['lng'];
        var location = LatLng(lat, lng);

        policemarker.add(Marker(
          markerId: MarkerId(name),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name),
        ));
      }
    } else {}
  }

  getmapstartlocation() {
    var mapstartlocation = nearestloc_services.currentlocation;
    return mapstartlocation;
  }

  final Completer<GoogleMapController> policecontroller = Completer();
  final List<Marker> policemarker = <Marker>[];
  Future<Position> getcurrentuserlocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) {
        print('error' + error.toString());
      },
    );
    return await Geolocator.getCurrentPosition();
  }

  getcurrentlocationuser() async {
    getcurrentuserlocation().then((value) async {
      LatLng currentlocation = LatLng(value.latitude, value.longitude);
      await getnearmarker('police', value.latitude, value.longitude);

      policemarker.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: InfoWindow(title: 'Current Location'),
      ));

      CameraPosition cameraPosition =
          CameraPosition(target: LatLng(value.latitude, value.longitude));

      final GoogleMapController controller = await policecontroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      rebuildUi();
    });
  }
}

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=24.9265786,67.0305041&radius=1500&type=fire_station&key=AIzaSyDT3LscTu25eNfJ2E_OBoogEIgHbh8oTvY
// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=24.9265786,67.0305041&radius=5500&type=police&key=AIzaSyDT3LscTu25eNfJ2E_OBoogEIgHbh8oTvY