import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// The function retrieves the saved theme mode from shared preferences and returns it as a ThemeMode
  /// enum value.
  ///
  /// Returns:
  ///   a `Future` object that resolves to a `ThemeMode` value or `null`.
  static Future<ThemeMode?> getSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getBool('isdarkmode') ?? false) ? ThemeMode.dark : null;
  }
}
