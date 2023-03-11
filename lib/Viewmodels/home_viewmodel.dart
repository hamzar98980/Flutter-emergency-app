import 'package:project/app/app.locator.dart';
import 'package:project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class home_viewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatetologin() {
    _navigationService.navigateTo(Routes.login);
  }
}
