import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project/Viewmodels/service_viewmodel/registerservice_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

import '../components/dropdownwidget.dart';

class ServiceRegister extends StatelessWidget {
  const ServiceRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController servname = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController servicetype = TextEditingController();
    String? selectedValue;
    final List<String> servicelist = [
      'Police',
      'Ambulance',
      'Fire Brigade',
    ];
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => Serviceregistration(),
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
              child: Icon(
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
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                          child: Text(
                            "Sign Up For Service Provider",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(color_const.primarycolor)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
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
                          padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: servname,
                              decoration: InputDecoration(
                                hintText: 'Service Provider Name',
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
                              controller: phone,
                              decoration: InputDecoration(
                                hintText: 'Phone',
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
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Email',
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
                          padding: EdgeInsets.fromLTRB(15, 20, 0, 1),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: pass,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 5.0,
                                        color: Color(color_const.primarycolor)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_const.primarycolor),
                                      width: 5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: DropdownButtonFormField2(
                                      decoration: InputDecoration(
                                        //Add isDense true and zero Padding.
                                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      isExpanded: true,
                                      hint: const Text(
                                        'Select Services',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      items: servicelist
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Select Services.';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        // if (onServiceSelected != null) {
                                        //   onServiceSelected!(selectedValue!);
                                        // }
                                        //Do something when changing the item if you want.
                                        selectedValue = value.toString();
                                        // print(selectedValue);
                                      },
                                      onSaved: (value) {
                                        selectedValue = value.toString();
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        height: 60,
                                        width: 600,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                            viewModel.registeruser(email.text, pass.text,
                                servname.text, phone.text, selectedValue);
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
