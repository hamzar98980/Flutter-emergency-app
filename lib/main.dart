import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      // home: FutureBuilder<Widget>(
      //   future: checkIfDataExists(context),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return snapshot.data!;
      //     } else {
      //       return const CircularProgressIndicator();
      //     }
      //   },
      // ),
    );
  }
}

// Future<Widget> checkIfDataExists(context) async {
//   final prefs = await SharedPreferences.getInstance();
//   bool emailExists = prefs.containsKey('email');
//   bool typeExists = prefs.containsKey('type');
//   if (emailExists == true) {
//     return const Policerequests();
//   } else {
//     return const Login();
//   }
// }
// Future<Widget> checkIfDataExists(context) async {
//   final prefs = await SharedPreferences.getInstance();
//   bool emailExists = prefs.containsKey('email');
//   bool typeExists = prefs.containsKey('type');
//   if (emailExists == true) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const Policerequests(),
//         ));
//   } else {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const Login(),
//         ));
//   }
// }
