import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

/// The `ReactiveMode` class provides a static method to check if the current theme mode is dark mode.
class ReactiveMode {
  /// The function checks if the current theme in the given context is set to dark mode.
  ///
  /// Args:
  ///   context (BuildContext): The `BuildContext` is an object that represents the location of a widget
  /// within the widget tree. It is typically passed down from the parent widget to its children
  /// widgets. The `BuildContext` provides access to various properties and methods related to the
  /// widget tree, such as accessing the current theme.
  static bool isDarkMode(BuildContext context) =>
      ThemeMutator.of(context).isDarkMode;
}
