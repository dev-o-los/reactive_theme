import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

class ReactiveMode {
  static bool isDarkMode(BuildContext context) =>
      ThemeMutator.of(context).isDarkMode;
}
