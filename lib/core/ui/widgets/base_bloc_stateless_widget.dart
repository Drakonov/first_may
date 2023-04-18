import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocStatelessWidget<B extends Bloc, E> extends StatelessWidget {
  const BaseBlocStatelessWidget({Key? key}) : super(key: key);

  ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;

  B getBloc(BuildContext context) => context.read<B>();

  void sendEvent(E event, BuildContext targetContext) {
    getBloc(targetContext).add(event);
  }
}
