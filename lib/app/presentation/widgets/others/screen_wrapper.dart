import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_may/app/bloc/app_bloc.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    required this.child,
    this.backgroundColor,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.floatingButton,
    this.floatingButtonLocation,
    super.key,
  });

  final Color? backgroundColor;
  final Widget child;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final Widget? floatingButton;
  final FloatingActionButtonLocation? floatingButtonLocation;

  @override
  Widget build(BuildContext context) => BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.learningMode != current.learningMode,
        builder: (context, state) => Scaffold(
          floatingActionButton: floatingButton,
          floatingActionButtonLocation: floatingButtonLocation,
          backgroundColor: backgroundColor,
          body: SafeArea(
            top: !state.learningMode && safeAreaTop,
            bottom: safeAreaBottom,
            left: safeAreaLeft,
            right: safeAreaRight,
            child: child,
          ),
        ),
      );
}
