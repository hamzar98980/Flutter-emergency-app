import 'package:flutter/material.dart';
import 'package:project/Viewmodels/register_viewmodal.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();

    return ViewModelBuilder<register_viewmodal>.reactive(
      viewModelBuilder: () => register_viewmodal(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
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
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(color_const.primarycolor)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                          child: Text(
                            "Sign up to continue",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(color_const.primarycolor)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: name,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_const.primarycolor),
                                      width: 2.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: phone,
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_const.primarycolor),
                                      width: 2.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_const.primarycolor),
                                      width: 2.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: pass,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_const.primarycolor),
                                      width: 5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            viewModel.registeruser(
                                email.text, pass.text, name.text, phone.text);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.7, 30),
                              backgroundColor: Color(color_const.primarycolor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.all(15)),
                          child: const Text(
                            "Create New Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Column(
                                children: const [
                                  Text("Alredy have an Account?"),
                                  Text("login to Continue"),
                                ],
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        )
                      ],
                    )
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
