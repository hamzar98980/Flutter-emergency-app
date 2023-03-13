import 'package:project/View/homeview.dart';
import 'package:project/View/login.dart';
import 'package:project/View/register.dart';
import 'package:project/View/usershelp.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../View/nearestlocation.dart';
import '../View/policmap.dart';
import '../View/serviceprovider/loginservice.dart';
import '../View/serviceprovider/registerservice.dart';
import '../services/nearestlocation_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Login),
    MaterialRoute(page: Homeview, initial: true),
    MaterialRoute(page: Register),
    MaterialRoute(page: Userhelp),
    MaterialRoute(page: Nearestloc),
    MaterialRoute(page: Policmap),
    MaterialRoute(page: Servicelogin),
    MaterialRoute(page: ServiceRegister),
  ],
  dependencies: [
    Singleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: nearestlocation_services,
    )
  ],
)
class App {}
