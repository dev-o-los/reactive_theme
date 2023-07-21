import 'package:flutter/widgets.dart';

/// The Helper class in Dart provides a static method to determine the background icon color based on
/// the given boolean values for isDarkMode and reverse.
class Helper {
  /// The function `bgiconcol` returns a color based on the values of `isDarkMode` and `reverse`
  /// parameters.
  ///
  /// Args:
  ///   isDarkMode (bool): A boolean value indicating whether the current mode is dark mode or not.
  ///   reverse (bool): The `reverse` parameter is a boolean value that indicates whether the color
  /// should be reversed or not.
  static Color bgiconcol(bool isDarkMode, bool reverse) =>
      switch ((isDarkMode, reverse)) {
        (true, true) => const Color(0xFFFFFFFF),
        (false, false) => const Color(0xFFFFFFFF),
        (true, false) => const Color(0xFF000000),
        (false, true) => const Color(0xFF000000),
      };
}
