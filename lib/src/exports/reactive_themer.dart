import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

class ReactiveThemer extends StatelessWidget {
  const ReactiveThemer({super.key, required this.child});

  final MaterialApp child;

  @override
  Widget build(BuildContext context) =>
      StateChangerForThemeMutator(child: child);
}
