import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/Viewmodels/userrequest_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class requestuser extends StatelessWidget {
  const requestuser({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => userrequest(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            'Requests',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.black,
          color: Color(color_const.primarycolor),
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            if (index == 1) {
              viewModel.navigatetohome();
            } else if (index == 0) {
              viewModel.navigatetocuurentloc();
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('userhelp')
                            .where('userid',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser?.uid)
                            .snapshots(),
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
