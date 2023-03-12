import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class nearest_viewmodel extends BaseViewModel {
  getnearmarker(type, lati, longitude) async {
    String apiKey = 'AIzaSyDT3LscTu25eNfJ2E_OBoogEIgHbh8oTvY';
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lati},${longitude}&radius=1500&type=$type&key=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> results = data['results'];

      for (var result in results) {
        var name = result['name'];
        var lat = result['geometry']['location']['lat'];
        var lng = result['geometry']['location']['lng'];
        var location = LatLng(lat, lng);

        markerlist.add(Marker(
          markerId: MarkerId(name),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name),
        ));
      }
    } else {}
  }

  LatLng currentlocation = LatLng(24.8607, 67.0011);
  final Completer<GoogleMapController> mycontroller = Completer();
  final List<Marker> markerlist = <Marker>[];

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
      await getnearmarker('hospital', value.latitude, value.longitude);
      print(markerlist);
      markerlist.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: InfoWindow(title: 'Current Location'),
      ));

      CameraPosition cameraPosition =
          CameraPosition(target: LatLng(value.latitude, value.longitude));

      final GoogleMapController controller = await mycontroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      rebuildUi();
    });
  }
}
