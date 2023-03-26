import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Viewmodels/service_viewmodel/policerequest_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

class Policerequests extends StatelessWidget {
  const Policerequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => police_request(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Police Stations Request",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: viewModel.getalldata(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final helpDocs = snapshot.data!.docs;
                          return ListView.builder(
                            itemCount: helpDocs.length,
                            itemBuilder: (context, index) {
                              final data = helpDocs[index].data()
                                  as Map<String, dynamic>;
                              return Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  child: ListTile(
                                    tileColor: Color(color_const.secondary),
                                    leading: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/problem.png'),
                                    ),
                                    title: Text(data['servicename'] ??
                                        'No service name'),
                                    subtitle: Text(data['servicetype'] ??
                                        'No service type'),
                                    trailing: const Icon(Icons.check_circle),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
