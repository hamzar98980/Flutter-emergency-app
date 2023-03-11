import 'package:flutter/material.dart';
import 'package:project/Viewmodels/login_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    return ViewModelBuilder<Login_viewmodel>.reactive(
      viewModelBuilder: () => Login_viewmodel(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
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
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(color_const.primarycolor)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
                          child: Text(
                            "Sign in to continue",
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
                          padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Enter Email',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
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
                          padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: pass,
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_const.primarycolor),
                                      width: 2.0),
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
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            viewModel.loginuser(email.text, pass.text);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.7, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.all(15),
                              primary: Color(color_const.primarycolor)),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Column(
                                children: [
                                  Text("Dont have an Account?"),
                                  Text("Create new account")
                                ],
                              ),
                              onTap: () {
                                viewModel.navigatetoregister();
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
