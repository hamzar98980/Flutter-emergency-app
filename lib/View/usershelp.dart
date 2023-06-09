import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/View/homeview.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

import '../Viewmodels/userhelp_viewmodel.dart';

class Userhelp extends StatelessWidget {
  const Userhelp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => userhelp_viewmodel(),
      builder: (context, viewmodel, child) => Scaffold(
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
            'Services',
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.black,
          color: Color(color_const.primarycolor),
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            if (index == 2) {
              viewmodel.navigatetorequest();
            } else if (index == 0) {
              viewmodel.navigatetocuurentloc();
            }

            print(index);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.asset('assets/images/img2.png'),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Services",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 15, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            viewmodel.navigatetopolice();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                color: Color(color_const.primarycolor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                        'assets/images/security.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        viewmodel.navigatetomap();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            color: Color(color_const.primarycolor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/ambulance.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 15, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Color(color_const.primarycolor),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset('assets/images/fire.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
