import 'package:flutter/material.dart';
import 'package:project/Viewmodels/userrequest_viewmodel.dart';
import 'package:stacked/stacked.dart';

class requestuser extends StatelessWidget {
  const requestuser({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => userrequest(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
