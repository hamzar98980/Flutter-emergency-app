// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:project/View/homeview.dart' as _i3;
import 'package:project/View/login.dart' as _i2;
import 'package:project/View/nearestlocation.dart' as _i6;
import 'package:project/View/policmap.dart' as _i7;
import 'package:project/View/register.dart' as _i4;
import 'package:project/View/serviceprovider/loginservice.dart' as _i8;
import 'package:project/View/serviceprovider/registerservice.dart' as _i9;
import 'package:project/View/serviceprovider/services_home.dart' as _i10;
import 'package:project/View/userrequests.dart' as _i11;
import 'package:project/View/usershelp.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const login = '/Login';

  static const homeview = '/';

  static const register = '/Register';

  static const userhelp = '/Userhelp';

  static const nearestloc = '/Nearestloc';

  static const policmap = '/Policmap';

  static const servicelogin = '/Servicelogin';

  static const serviceRegister = '/service-register';

  static const servicehome = '/Servicehome';

  static const requestuser = '/requestuser';

  static const all = <String>{
    login,
    homeview,
    register,
    userhelp,
    nearestloc,
    policmap,
    servicelogin,
    serviceRegister,
    servicehome,
    requestuser,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.login,
      page: _i2.Login,
    ),
    _i1.RouteDef(
      Routes.homeview,
      page: _i3.Homeview,
    ),
    _i1.RouteDef(
      Routes.register,
      page: _i4.Register,
    ),
    _i1.RouteDef(
      Routes.userhelp,
      page: _i5.Userhelp,
    ),
    _i1.RouteDef(
      Routes.nearestloc,
      page: _i6.Nearestloc,
    ),
    _i1.RouteDef(
      Routes.policmap,
      page: _i7.Policmap,
    ),
    _i1.RouteDef(
      Routes.servicelogin,
      page: _i8.Servicelogin,
    ),
    _i1.RouteDef(
      Routes.serviceRegister,
      page: _i9.ServiceRegister,
    ),
    _i1.RouteDef(
      Routes.servicehome,
      page: _i10.Servicehome,
    ),
    _i1.RouteDef(
      Routes.requestuser,
      page: _i11.requestuser,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Login: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Login(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.Homeview: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Homeview(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.Register: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.Register(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.Userhelp: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.Userhelp(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.Nearestloc: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.Nearestloc(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.Policmap: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Policmap(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.Servicelogin: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.Servicelogin(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.ServiceRegister: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ServiceRegister(),
        settings: data,
        maintainState: false,
      );
    },
    _i10.Servicehome: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.Servicehome(),
        settings: data,
        maintainState: false,
      );
    },
    _i11.requestuser: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.requestuser(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToLogin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.login,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegister([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.register,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserhelp([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userhelp,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNearestloc([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.nearestloc,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPolicmap([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.policmap,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServicelogin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.servicelogin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServiceRegister([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.serviceRegister,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServicehome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.servicehome,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestuser([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.requestuser,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLogin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.login,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegister([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.register,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserhelp([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userhelp,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNearestloc([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.nearestloc,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPolicmap([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.policmap,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithServicelogin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.servicelogin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithServiceRegister([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.serviceRegister,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithServicehome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.servicehome,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestuser([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.requestuser,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
