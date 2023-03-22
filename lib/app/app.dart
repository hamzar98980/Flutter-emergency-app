import 'package:project/View/homeview.dart';
import 'package:project/View/login.dart';
import 'package:project/View/register.dart';
import 'package:project/View/serviceprovider/services_home.dart';
import 'package:project/View/usershelp.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../View/nearestlocation.dart';
import '../View/policmap.dart';
import '../View/serviceprovider/loginservice.dart';
import '../View/serviceprovider/policerequest.dart';
import '../View/serviceprovider/registerservice.dart';
import '../View/usercurrentloc.dart';
import '../View/userrequests.dart';
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
    MaterialRoute(page: Servicehome),
    MaterialRoute(page: requestuser),
    MaterialRoute(page: Policerequests),
    MaterialRoute(page: Usercurrentloc),
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
