import 'package:flutter/widgets.dart';

class Helper {
  static Color bgiconcol(bool isDarkMode, bool reverse) =>
      switch ((isDarkMode, reverse)) {
        (true, true) => const Color(0xFFFFFFFF),
        (false, false) => const Color(0xFFFFFFFF),
        (true, false) => const Color(0xFF000000),
        (false, true) => const Color(0xFF000000),
      };
}
