import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project/Viewmodels/service_viewmodel/loginservice_viewmodel.dart';
import 'package:project/constrainsts/color_const.dart';
import 'package:stacked/stacked.dart';

class Servicelogin extends StatelessWidget {
  const Servicelogin({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();

    String? selectedValue;
    final List<String> servicelist = [
      'Police',
      'Ambulance',
      'Fire Brigade',
    ];

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => loginservice(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                          child: Text(
                            "Sign In As A Service Provider",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(color_const.primarycolor)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
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
                          padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Enter Email',
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
                              obscureText: viewModel.passwordwhow,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    viewModel.passwordwhow == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    viewModel.passwordshowfunction();
                                  },
                                ),
                                hintText: 'Enter Password',
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
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'Select Services',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: servicelist
                                      .map((item) => DropdownMenuItem<String>(
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
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
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
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Dropdwonform(),
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
                            if (email.text == '') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor:
                                    Color(color_const.primarycolor),
                                content: const Text("Email Field Is Required"),
                                duration: const Duration(seconds: 5),
                              ));
                            } else if (pass.text == '') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor:
                                    Color(color_const.primarycolor),
                                content:
                                    const Text("Password Field Is Required"),
                                duration: const Duration(seconds: 5),
                              ));
                            } else if (selectedValue == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor:
                                    Color(color_const.primarycolor),
                                content: const Text("Select Your Services"),
                                duration: const Duration(seconds: 5),
                              ));
                            } else {
                              viewModel.loginuser(
                                  email.text, pass.text, selectedValue);
                            }
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
                                children: const [
                                  Text("Dont have an Account?"),
                                  Text("Create new account")
                                ],
                              ),
                              onTap: () {
                                viewModel.navigatetoregsit();
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
