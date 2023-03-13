import 'package:flutter/material.dart';
import 'package:project/Viewmodels/service_viewmodel/servichome_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Servicehome extends StatelessWidget {
  const Servicehome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => servicehomemodel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
