import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Viewmodels/nearest_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

import 'components/alertbox.dart';

class Nearestloc extends StatefulWidget {
  const Nearestloc({super.key});

  @override
  State<Nearestloc> createState() => _NearestlocState();
}

class _NearestlocState extends State<Nearestloc> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => nearest_viewmodel(),
      builder: (context, viewmodel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            viewmodel.getcurrentlocationuser();
          },
          child: const Icon(Icons.pin_drop),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Hospitals",
            style: TextStyle(color: Colors.black),
          ),
          leading: Container(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.57,
                  child: GoogleMap(
                    markers: Set<Marker>.of(viewmodel.markerlist),
                    initialCameraPosition: CameraPosition(
                      target: viewmodel.currentlocation,
                      zoom: 15,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      viewmodel.mycontroller.complete(controller);
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            viewmodel.addhospitals(
                                'Medical Emergency', 'Ambulance');
                            BlurryDialog alert = BlurryDialog(
                                Servicestype:
                                    'for Medical Emergency has been submitted Hospital');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.7, 30),
                              backgroundColor: Color(color_const.primarycolor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.all(15)),
                          child: const Text(
                            "Medical Emergency",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            viewmodel.addhospitals('Fire', 'Ambulance');
                            BlurryDialog alert = BlurryDialog(
                                Servicestype:
                                    'for Fire has been submitted Hospital');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.7, 30),
                              backgroundColor: Color(color_const.primarycolor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.all(15)),
                          child: const Text(
                            "Fire",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            viewmodel.addhospitals('Accident', 'Ambulance');
                            BlurryDialog alert = BlurryDialog(
                                Servicestype:
                                    'for Accident has been submitted Hospital');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.7, 30),
                              backgroundColor: Color(color_const.primarycolor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.all(15)),
                          child: const Text(
                            "Accident",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
