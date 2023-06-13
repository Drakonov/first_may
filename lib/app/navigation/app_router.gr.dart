// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:first_may/app/presentation/screens/example/example_screen.dart'
    as _i1;
import 'package:first_may/app/presentation/screens/splash/splash_screen.dart'
    as _i2;
import 'package:first_may/app/presentation/screens/table/table_screen.dart'
    as _i3;
import 'package:first_may/app/presentation/screens/totals/totals_screen.dart'
    as _i4;
import 'package:first_may/model/sells.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ExampleScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i1.ExampleScreen()),
      );
    },
    SplashScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.SplashScreen()),
      );
    },
    TableScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.TableScreen()),
      );
    },
    TotalsScreen.name: (routeData) {
      final args = routeData.argsAs<TotalsScreenArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(
            child: _i4.TotalsScreen(
          key: args.key,
          sells: args.sells,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.ExampleScreen]
class ExampleScreen extends _i5.PageRouteInfo<void> {
  const ExampleScreen({List<_i5.PageRouteInfo>? children})
      : super(
          ExampleScreen.name,
          initialChildren: children,
        );

  static const String name = 'ExampleScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen({List<_i5.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TableScreen]
class TableScreen extends _i5.PageRouteInfo<void> {
  const TableScreen({List<_i5.PageRouteInfo>? children})
      : super(
          TableScreen.name,
          initialChildren: children,
        );

  static const String name = 'TableScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TotalsScreen]
class TotalsScreen extends _i5.PageRouteInfo<TotalsScreenArgs> {
  TotalsScreen({
    _i6.Key? key,
    required List<_i7.Sell> sells,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          TotalsScreen.name,
          args: TotalsScreenArgs(
            key: key,
            sells: sells,
          ),
          initialChildren: children,
        );

  static const String name = 'TotalsScreen';

  static const _i5.PageInfo<TotalsScreenArgs> page =
      _i5.PageInfo<TotalsScreenArgs>(name);
}

class TotalsScreenArgs {
  const TotalsScreenArgs({
    this.key,
    required this.sells,
  });

  final _i6.Key? key;

  final List<_i7.Sell> sells;

  @override
  String toString() {
    return 'TotalsScreenArgs{key: $key, sells: $sells}';
  }
}
