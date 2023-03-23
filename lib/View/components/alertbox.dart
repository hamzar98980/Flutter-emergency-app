import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:project/constrainsts/color_const.dart';

class BlurryDialog extends StatelessWidget {
  String Servicestype;
  BlurryDialog({super.key, required this.Servicestype});
  TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
        child: AlertDialog(
          title: Text(
            "Request Submitted",
            style: textStyle,
          ),
          content: Text(
            "Your Application $Servicestype",
            style: TextStyle(color: Color(color_const.primarycolor)),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12)),
              child: const Text("OK"),
            ),
          ],
        ));
  }
}
