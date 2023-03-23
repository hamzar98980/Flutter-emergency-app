import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

import '../Viewmodels/usercurrentloc_viewmodel.dart';

class Usercurrentloc extends StatelessWidget {
  const Usercurrentloc({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => userlocation(),
      builder: (context, viewModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            viewModel.getcurrentlocationuser();
          },
          child: const Icon(Icons.pin_drop),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.black,
          color: Color(color_const.primarycolor),
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            if (index == 2) {
              viewModel.navigatetorequest();
            } else if (index == 1) {
              viewModel.navigatetohome();
            }
          },
          items: const [
            Icon(
              Icons.pin_drop,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.add_circle_outline,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.checklist_rtl_sharp,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: GoogleMap(
            markers: Set<Marker>.of(viewModel.markerlist),
            initialCameraPosition: CameraPosition(
              target: viewModel.currentlocation,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              viewModel.mycontroller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
