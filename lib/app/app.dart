import 'package:project/View/homeview.dart';
import 'package:project/View/login.dart';
import 'package:project/View/register.dart';
import 'package:project/View/usershelp.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../View/nearestlocation.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Login),
    MaterialRoute(page: Homeview, initial: true),
    MaterialRoute(page: Register),
    MaterialRoute(page: Userhelp),
    MaterialRoute(page: Nearestloc),
  ],
  dependencies: [
    Singleton(
      classType: NavigationService,
    ),
  ],
)
class App {}
