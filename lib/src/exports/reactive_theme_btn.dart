import 'package:flutter/material.dart';
import '../private/theme_mutator.dart';

class ReactiveThemeBtn extends StatelessWidget {
  /// The code is defining a constructor for the `ReactiveThemeBtn` class. The constructor takes several
  /// optional named parameters with default values.
  const ReactiveThemeBtn({
    super.key,
    this.bgColWhenLg = Colors.white,
    this.bgColWhendk = Colors.black87,
    this.iconColWhendk = Colors.white,
    this.iconColWhenLg = Colors.black87,
    this.darkmodeIcon = Icons.dark_mode,
    this.lightmodeIcon = Icons.sunny,
    this.transitionType,
    this.reverse = false,
  });

  /// `bgColWhenLg` is a named parameter in the constructor of the `ReactiveThemeBtn`
  /// class. It represents the background color of the button when the app is in light
  /// mode. By default, it is set to `Colors.white`.
  final Color? bgColWhenLg;

  /// `bgColWhendk` is a named parameter in the constructor of the `ReactiveThemeBtn` class.
  /// It represents the background color of the button when the app is in dark mode. By
  /// default, it is set to `Colors.black87`.
  final Color? bgColWhendk;

  /// `iconColWhenLg` is a named parameter in the constructor of the `ReactiveThemeBtn`
  /// class. It represents the color of the icon on the button when the app is in light
  /// mode. By default, it is set to `Colors.black87`.
  final Color? iconColWhenLg;

  final Color? iconColWhendk;

  /// The `transitionType` parameter in the `ReactiveThemeBtn` class is a function that defines the
  /// transition animation for the icon when the theme mode is toggled. It takes a `Widget` child and
  /// an `Animation<double>` animation as parameters and returns a new `Widget` that represents the
  /// animated transition.
  final Widget Function(Widget child, Animation<double> animation)?
      transitionType;

  /// The `reverse` parameter in the `ReactiveThemeBtn` class is a boolean value that
  /// determines the order of the icons displayed on the button.
  final bool? reverse;

  /// The `darkmodeIcon` is a named parameter in the constructor of the
  /// `ReactiveThemeBtn` class. It represents the icon that will be displayed on the
  /// button when the app is in dark mode. The default value is set to
  /// `Icons.dark_mode`.
  final IconData? darkmodeIcon;

  /// The `lightmodeIcon` is a named parameter in the constructor of the
  /// `ReactiveThemeBtn` class. It represents the icon that will be displayed on the
  /// button when the app is in light mode. The default value is set to `Icons.sunny`.
  final IconData? lightmodeIcon;

  @override
  Widget build(BuildContext context) {
    /// `final thememutator = ThemeMutator.of(context);` is assigning the value returned by the `of`
    /// method of the `ThemeMutator` class to the variable `thememutator`.
    final thememutator = ThemeMutator.of(context);
    return Container(
      decoration: BoxDecoration(
        color: thememutator.isDarkMode ? bgColWhendk : bgColWhenLg,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => thememutator.toggleStatus(),
        color: thememutator.isDarkMode ? iconColWhendk : iconColWhenLg,
        icon: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: transitionType ??
              (child, animation) => RotationTransition(
                    turns: animation,
                    child: child,
                  ),
          child: thememutator.isDarkMode
              ? Icon(
                  reverse! ? lightmodeIcon : darkmodeIcon,
                  key: ValueKey(1),
                )
              : Icon(
                  reverse! ? darkmodeIcon : lightmodeIcon,
                  key: ValueKey(2),
                ),
        ),
      ),
    );
  }
}
