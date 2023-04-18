import 'package:first_may/app/bloc/app_bloc.dart';
import 'package:first_may/app/navigation/app_router.dart';
import 'package:first_may/core/ui/scroll_behavior/disable_glow_effect_scroll_behavior.dart';
import 'package:first_may/core/ui/widgets/base_bloc_listener.dart';
import 'package:first_may/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:first_may/core/ui/widgets/close_keyboard_by_tap.dart';
import 'package:first_may/domain/enums/color_scheme_type.dart';
import 'package:first_may/localization/app_localizations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatefulWidget {
  const App(
    this.appRouter, {
    super.key,
  });

  final AppRouter appRouter;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BaseBlocStateWidget<App, AppBloc, AppEvent> with WidgetsBindingObserver {
  static const List<Locale> _supportedLocales = [
    Locale('ru'),
  ];

  NavigatorObserver _navigatorObserver = NavigatorObserver();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    sendEvent(
      AppEvent.appLifecycleStateChanged(state),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //Hive.close();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) => BaseBlocListener<AppBloc, AppState>(
        listenWhen: (previous, current) =>
            previous.action != current.action || previous.colorSchemeMode != current.colorSchemeMode,
        listener: (context, state, action) async {
          //log('catch listener',name: 'Info');
          //if (action is SwitchColorScheme) {
          //  log('catch listener',name: 'Info');
          //  context.sendEvent<AppBloc>(const AppEvent.switchColorScheme());
          //}
        },
        child: BlocBuilder<AppBloc, AppState>(
          buildWhen: (previous, current) =>
              previous.locale != current.locale || previous.colorSchemeMode != current.colorSchemeMode,
          builder: (context, state) {
            ThemeMode themeMode = getColorsSchemeMode(state.colorSchemeMode);
            return OverlaySupport.global(
              child: CloseKeyboardByTap(
                MaterialApp.router(
                  //theme: buildLightTheme(),
                  //darkTheme: buildDarkTheme(),
                  //themeMode: themeMode,
                  locale: state.locale,
                  debugShowCheckedModeBanner: false,
                  builder: (_, widget) {
                    Widget child = widget ?? const SizedBox();

                    return ScrollConfiguration(
                      behavior: const DisableGrowEffectScrollBehavior(),
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: FlexColorScheme.themedSystemNavigationBar(
                          context,
                          //systemNavBarStyle: FlexSystemNavBarStyle.background,
                          useDivider: false,
                          opacity: 0,
                        ),
                        child: Column(
                          children: [
                            Expanded(child: child),
                          ],
                        ),
                      ),
                    );
                  },
                  localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                    AppLocalizations.getDelegate(_supportedLocales),
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: _supportedLocales,
                  routerDelegate: widget.appRouter.delegate(
                    navigatorObservers: () {
                      _navigatorObserver = NavigatorObserver();
                      return [_navigatorObserver];
                    },
                  ),
                  routeInformationParser: widget.appRouter.defaultRouteParser(),
                ),
              ),
            );
          },
        ),
      );

  ThemeData buildDarkTheme() {
    return FlexThemeData.dark(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      transparentStatusBar: false,
      //appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
      ),
      //useMaterial3:true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );
  }

  ThemeData buildLightTheme() {
    return FlexThemeData.light(
      scheme: FlexScheme.materialHc,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      transparentStatusBar: false,
      //appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      primary: const Color(0xff9547DB),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );
  }

  ThemeMode getColorsSchemeMode(ColorSchemeMode schemeMode) {
    ThemeMode themeMode = ThemeMode.system;
    switch (schemeMode) {
      case ColorSchemeMode.auto:
        themeMode = ThemeMode.system;
        break;
      case ColorSchemeMode.dark:
        themeMode = ThemeMode.dark;
        break;
      case ColorSchemeMode.light:
        themeMode = ThemeMode.light;
        break;
    }
    return themeMode;
  }
}
