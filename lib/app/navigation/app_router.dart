import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreen.page, path: '/'),
    AutoRoute(page: ExampleScreen.page),
    AutoRoute(page: TableScreen.page),
    AutoRoute(page: TotalsScreen.page),
  ];
}
