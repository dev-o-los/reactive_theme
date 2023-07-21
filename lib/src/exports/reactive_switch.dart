import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

class ReactiveSwitch extends StatefulWidget {
  /// The `const ReactiveSwitch` constructor is defining the parameters and default values for the
  /// `ReactiveSwitch` widget.
  const ReactiveSwitch({
    Key? key,
    this.darkmodeIcon = const Icon(Icons.dark_mode),
    this.lightModeIcon = const Icon(Icons.sunny),
    this.activeCol = Colors.grey,
    this.inactiveIconColor = Colors.black87,
  }) : super(key: key);

  /// The line `Icon? darkmodeIcon;` is declaring a final variable named `darkmodeIcon` of type
  /// `Icon?`. The `?` indicates that the variable can be nullable, meaning it can have a value of
  /// `null`.
  final Icon? darkmodeIcon;

  /// The line `Icon? lightModeIcon;` is declaring a final variable named `lightModeIcon` of type
  /// `Icon?`. The `?` indicates that the variable can be nullable, meaning it can have a value of
  /// `null`.
  final Icon? lightModeIcon;

  /// The line `Color? activeCol;` is declaring a final variable named `activeCol` of type
  /// `Color?`. The `?` indicates that the variable can be nullable, meaning it can have a value of
  /// `null`. This variable is used to specify the color of the switch when it is in the active state.
  final Color? activeCol;

  /// The line `Color? inactiveIconColor;` is declaring a final variable named `inactiveIconColor`
  /// of type `Color?`. The `?` indicates that the variable can be nullable, meaning it can have a value
  /// of `null`. This variable is used to specify the color of the switch's thumb icon when it is in the
  /// inactive state.
  final Color? inactiveIconColor;

  @override
  State<ReactiveSwitch> createState() => _ReactiveSwitchState();
}

class _ReactiveSwitchState extends State<ReactiveSwitch> {
  bool isDarkMode = false;

  /// This function builds a switch widget that toggles between dark and light mode and updates the
  /// theme accordingly.
  ///
  /// Args:
  ///   context (BuildContext): The `context` parameter is a reference to the current build context. It
  /// provides access to various properties and methods related to the current widget tree, such as
  /// accessing the theme, navigating to other screens, or retrieving inherited widget data.
  ///
  /// Returns:
  ///   The code is returning a Switch widget.
  @override
  Widget build(BuildContext context) {
    /// The line `thememutator` is creating a local variable named
    /// `thememutator` and assigning it the value returned by the static method `of` of the
    /// `ThemeMutator` class.
    final thememutator = ThemeMutator.of(context);
    isDarkMode = thememutator.isDarkMode;

    /// The code is returning a `Switch` widget with adaptive behavior.
    return Switch.adaptive(
      /// The `activeColor` property is used to specify the color of the switch when it is in the active
      /// state. It takes the value of `widget.activeCol`, which is a color specified by the user when
      /// using the `ReactiveSwitch` widget.
      activeColor: widget.activeCol,
      inactiveThumbColor: widget.inactiveIconColor,

      /// The `thumbIcon` property of the `Switch` widget is used to specify the icon that is displayed
      /// on the switch's thumb (the circular button that the user can drag to toggle the switch).
      thumbIcon: isDarkMode
          ? MaterialStateProperty.all(widget.darkmodeIcon)
          : MaterialStateProperty.all(widget.lightModeIcon),
      value: isDarkMode,

      /// The `onChanged` property of the `Switch` widget is a callback function that is called when the
      /// value of the switch changes. In this case, when the user toggles the switch, the `onChanged`
      /// callback is triggered.
      onChanged: (value) {
        /// The `setState(() { ... })` method is used to update the state of the widget. In this case,
        /// it is updating the value of the `value` variable and calling the `toggleStatus()` method of
        /// the `thememutator` object.
        setState(() {
          isDarkMode = value;
          thememutator.toggleStatus();
        });
      },
    );
  }
}
