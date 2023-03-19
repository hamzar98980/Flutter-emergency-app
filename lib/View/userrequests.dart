import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/Viewmodels/userrequest_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
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
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
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
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            if (index == 1) {
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                    child: FutureBuilder(
                        future: viewModel.alluserrequest(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  String servicenane =
                                      snapshot.data.docs[index]['servicename'];
                                  String servicetype =
                                      snapshot.data.docs[index]['servicename'];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: Color(color_const.secondary),
                                      leading: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/problem.png'),
                                      ),
                                      title: Text("${servicenane}"),
                                      subtitle: Text('${servicetype}'),
                                      trailing: Icon(Icons.check_circle),
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                                child: Container(
                                    child: CircularProgressIndicator()));
                          }
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
