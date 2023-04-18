import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RedBorder extends StatelessWidget {
  const RedBorder({required this.child,super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.redAccent,
          width: 10,
        ),
      ),
      child: child);
}
