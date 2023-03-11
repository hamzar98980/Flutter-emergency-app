import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class NearestHospitalsMapApp extends StatefulWidget {
  @override
  _NearestHospitalsMapAppState createState() => _NearestHospitalsMapAppState();
}

class _NearestHospitalsMapAppState extends State<NearestHospitalsMapApp> {
  late GoogleMapController _mapController;
  Position? _position = null;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _position = position;
      });
      _getNearestHospitals();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getNearestHospitals() async {
    String apiKey = 'AIzaSyDT3LscTu25eNfJ2E_OBoogEIgHbh8oTvY';
    var lati = 25.1193;
    var longitude = 55.37773;
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lati},${longitude}&radius=1500&type=hospital&key=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> results = data['results'];

      for (var result in results) {
        var name = result['name'];
        var lat = result['geometry']['location']['lat'];
        var lng = result['geometry']['location']['lng'];
        var location = LatLng(lat, lng);

        _markers.add(Marker(
          markerId: MarkerId(name),
          position: location,
          infoWindow: InfoWindow(title: name),
        ));
      }
      setState(() {});
    } else {
      // handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearest Hospitals Map',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nearest Hospitals Map'),
        ),
        body: GoogleMap(
          onMapCreated: (controller) {
            setState(() {
              _mapController = controller;
            });
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(_position!.latitude, _position!.longitude),
            zoom: 14,
          ),
          markers: _markers,
        ),
      ),
    );
  }
}
