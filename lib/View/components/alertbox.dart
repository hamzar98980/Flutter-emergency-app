import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:project/constrainsts/color_const.dart';

class BlurryDialog extends StatelessWidget {
  String Servicestype;
  BlurryDialog({super.key, required this.Servicestype});
  TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: Text(
            "Request Submitted",
            style: textStyle,
          ),
          content: Text(
            "Your Application ${Servicestype}",
            style: TextStyle(color: Color(color_const.primarycolor)),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12)),
            ),
          ],
        ));
  }
}
