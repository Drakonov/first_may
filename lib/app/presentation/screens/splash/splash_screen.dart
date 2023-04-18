import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_may/app/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:first_may/app/presentation/widgets/others/screen_wrapper.dart';
import 'package:first_may/core/ui/widgets/base_bloc_listener.dart';
import 'package:first_may/di/app_locator.dart';


@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget wrappedRoute(context) => BlocProvider(
        create: (context) => SplashBloc(
          Locator.injection(),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) => BaseBlocListener<SplashBloc, SplashState>(
        child: ScreenWrapper(
          child: Row(
            children: [
              Expanded(
                child: BlocBuilder<SplashBloc, SplashState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [CircularProgressIndicator()],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
