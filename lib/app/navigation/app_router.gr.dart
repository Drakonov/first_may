// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:first_may/app/presentation/screens/example/example_screen.dart'
    as _i1;
import 'package:first_may/app/presentation/screens/splash/splash_screen.dart'
    as _i2;
import 'package:first_may/app/presentation/screens/table/table_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ExampleScreen.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i1.ExampleScreen()),
      );
    },
    SplashScreen.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i2.SplashScreen()),
      );
    },
    TableScreen.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i3.TableScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.ExampleScreen]
class ExampleScreen extends _i4.PageRouteInfo<void> {
  const ExampleScreen({List<_i4.PageRouteInfo>? children})
      : super(
          ExampleScreen.name,
          initialChildren: children,
        );

  static const String name = 'ExampleScreen';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen({List<_i4.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TableScreen]
class TableScreen extends _i4.PageRouteInfo<void> {
  const TableScreen({List<_i4.PageRouteInfo>? children})
      : super(
          TableScreen.name,
          initialChildren: children,
        );

  static const String name = 'TableScreen';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
