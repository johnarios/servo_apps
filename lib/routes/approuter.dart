import 'package:auto_route/auto_route.dart';

import 'approuter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: "/", initial: true, page: SplashRoute.page),
    AutoRoute(path: "/home", page: HomeRoute.page),
    AutoRoute(path: "/support_center_page", page: SupportCenterRoute.page),
    AutoRoute(path: "/faq_page", page: FAQRoute.page),
  ];
}
