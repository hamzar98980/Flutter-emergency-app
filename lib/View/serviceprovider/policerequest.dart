import 'package:flutter/material.dart';
import 'package:project/Viewmodels/service_viewmodel/policerequest_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Policerequests extends StatelessWidget {
  const Policerequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => police_request(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text("Police Stations Request"),
        ),
      ),
    );
  }
}
