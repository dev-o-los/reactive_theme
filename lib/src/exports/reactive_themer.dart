import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

typedef ReactiveApp = Widget Function(ThemeMode reactiveMode);

/// The `ReactiveThemer` class is a `StatelessWidget` that wraps a `MaterialApp` and provides a way to
/// change the theme dynamically.
class ReactiveThemer extends StatelessWidget {
  /// The line `const ReactiveThemer({super.key, required this.child});` is defining a constructor for
  /// the `ReactiveThemer` class.
  const ReactiveThemer({super.key, required this.builder});

  /// The line `final MaterialApp child;` is declaring a final variable named `child` of type
  /// `MaterialApp`. This variable is used to store the child widget that will be wrapped by the
  /// `ReactiveThemer` widget.
  final ReactiveApp builder;

  /// The build function returns a StateChangerForThemeMutator widget with the child widget as its
  /// child.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext is an object that provides access to various
  /// information about the current build context, such as the theme, media queries, and navigation. It
  /// is typically passed down from the parent widget to its child widgets.
  @override
  Widget build(BuildContext context) =>
      StateChangerForThemeMutator(child: builder);
}
