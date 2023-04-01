import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Viewmodels/polic_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

import 'components/alertbox.dart';

class Policmap extends StatelessWidget {
  const Policmap({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => policviewmodel(),
      builder: ((context, viewModel, child) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                viewModel.getcurrentlocationuser();
              },
              child: const Icon(Icons.pin_drop),
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "Nearest Police Station",
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
                        markers: Set<Marker>.of(viewModel.policemarker),
                        initialCameraPosition: CameraPosition(
                          target: viewModel.getmapstartlocation(),
                          zoom: 15,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          viewModel.policecontroller.complete(controller);
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
                                viewModel.polichelp('Fight / Fire', 'Police');
                                BlurryDialog alert = BlurryDialog(
                                    Servicestype:
                                        'for Fight / Fire has been submitted Police');
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.7,
                                      30),
                                  backgroundColor:
                                      Color(color_const.primarycolor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.all(15)),
                              child: const Text(
                                "Fight / Fire",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.polichelp('Robbery', 'Police');
                                BlurryDialog alert = BlurryDialog(
                                    Servicestype:
                                        'for Robbery has been submitted Police');
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.7,
                                      30),
                                  backgroundColor:
                                      Color(color_const.primarycolor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.all(15)),
                              child: const Text(
                                "Robbery",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.polichelp('Harassment', 'Police');
                                BlurryDialog alert = BlurryDialog(
                                    Servicestype:
                                        'for Harassment has been submitted Police');
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.7,
                                      30),
                                  backgroundColor:
                                      Color(color_const.primarycolor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.all(15)),
                              child: const Text(
                                "Harassment",
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
          )),
    );
  }
}
