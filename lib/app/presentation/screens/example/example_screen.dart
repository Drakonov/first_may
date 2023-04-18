import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_may/app/presentation/screens/example/bloc/example_bloc.dart';
import 'package:first_may/app/presentation/widgets/others/screen_wrapper.dart';
import 'package:first_may/core/ui/widgets/base_bloc_listener.dart';
import 'package:first_may/di/app_locator.dart';

@RoutePage()
class ExampleScreen extends StatelessWidget implements AutoRouteWrapper {
  const ExampleScreen({super.key});

  @override
  Widget wrappedRoute(context) => BlocProvider(
        create: (context) => ExampleBloc(
          Locator.injection(),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) => BaseBlocListener<ExampleBloc, ExampleState>(
        child: ScreenWrapper(
          child: Container(),
        ),
      );
}
