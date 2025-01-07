// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:servo_applications/screens/page/faq_page.dart' as _i1;
import 'package:servo_applications/screens/page/home_page.dart' as _i2;
import 'package:servo_applications/screens/page/splash_page.dart' as _i3;
import 'package:servo_applications/screens/page/support_center_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    FAQRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FAQPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    SupportCenterRoute.name: (routeData) {
      final args = routeData.argsAs<SupportCenterRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SupportCenterPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.FAQPage]
class FAQRoute extends _i5.PageRouteInfo<void> {
  const FAQRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FAQRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SupportCenterPage]
class SupportCenterRoute extends _i5.PageRouteInfo<SupportCenterRouteArgs> {
  SupportCenterRoute({
    _i6.Key? key,
    required String title,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SupportCenterRoute.name,
          args: SupportCenterRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'SupportCenterRoute';

  static const _i5.PageInfo<SupportCenterRouteArgs> page =
      _i5.PageInfo<SupportCenterRouteArgs>(name);
}

class SupportCenterRouteArgs {
  const SupportCenterRouteArgs({
    this.key,
    required this.title,
  });

  final _i6.Key? key;

  final String title;

  @override
  String toString() {
    return 'SupportCenterRouteArgs{key: $key, title: $title}';
  }
}
