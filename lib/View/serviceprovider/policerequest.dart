import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Viewmodels/service_viewmodel/policerequest_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

import '../homeview.dart';

class Policerequests extends StatelessWidget {
  const Policerequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => police_request(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homeview(),
                  ));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Your Requests',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
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

                              var userid = data['userid'];
                              return Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  child: ListTile(
                                    onTap: () {
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            //the rounded corner is created here
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius
                                                        .only(
                                                    topLeft:
                                                        Radius.circular(40.0),
                                                    topRight:
                                                        Radius.circular(40.0)),
                                                color: Color(
                                                    color_const.secondary),
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child:
                                                  StreamBuilder<QuerySnapshot>(
                                                stream: viewModel
                                                    .getalluserdata(userid),
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                  final userdocs =
                                                      snapshot.data!.docs;

                                                  return ListView.builder(
                                                    itemCount: userdocs.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final usersdata =
                                                          userdocs[index].data()
                                                              as Map<String,
                                                                  dynamic>;
                                                      var username =
                                                          usersdata['Name'];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 20, 0, 0),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  1,
                                                              child: DataTable(
                                                                dataRowColor:
                                                                    MaterialStateProperty.all(
                                                                        Colors.grey[
                                                                            100]),
                                                                columns: const [
                                                                  DataColumn(
                                                                    label: Text(
                                                                        'User Data'),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Text(
                                                                        ''),
                                                                  ),
                                                                ],
                                                                rows: [
                                                                  DataRow(
                                                                    cells: [
                                                                      const DataCell(
                                                                          Text(
                                                                              'Service type')),
                                                                      DataCell(Text(
                                                                          data[
                                                                              'servicename'])),
                                                                    ],
                                                                  ),
                                                                  DataRow(
                                                                    cells: [
                                                                      const DataCell(
                                                                          Text(
                                                                              'Name')),
                                                                      DataCell(Text(
                                                                          username)),
                                                                    ],
                                                                  ),
                                                                  DataRow(
                                                                    cells: [
                                                                      const DataCell(
                                                                          Text(
                                                                              'Number')),
                                                                      DataCell(Text(
                                                                          usersdata[
                                                                              'phone'])),
                                                                    ],
                                                                  ),
                                                                  DataRow(
                                                                    cells: [
                                                                      const DataCell(
                                                                          Text(
                                                                              'Email')),
                                                                      DataCell(Text(
                                                                          usersdata[
                                                                              'email'])),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Center(
                                                              child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 30),
                                                                      backgroundColor: data['status'] == '2' ? Colors.green : Color(color_const.primarycolor),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      padding: const EdgeInsets.all(15)),
                                                                  onPressed: data['status'] == '1'
                                                                      ? () {
                                                                          Navigator.pop(
                                                                              context);

                                                                          viewModel
                                                                              .updatedata(data['docId']);
                                                                          viewModel
                                                                              .showdialog(context);
                                                                        }
                                                                      : null,
                                                                  child: data['status'] == '2' ? const Text("Completed") : const Text("Complete")),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          });
                                    },
                                    tileColor: Color(color_const.secondary),
                                    leading: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/problem.png'),
                                    ),
                                    title: Text(data['servicename'] ??
                                        'No service name'),
                                    subtitle: Text(data['servicetype'] ??
                                        'No service type'),
                                    trailing: Icon(
                                      data['status'] == '2'
                                          ? Icons.check_circle
                                          : Icons.cancel,
                                      color: data['status'] == '2'
                                          ? Colors.green
                                          : Colors.red,
                                    ),
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
