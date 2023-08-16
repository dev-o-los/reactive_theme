import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The `StateChangerForThemeMutator` class is a StatefulWidget that manages the state of a theme
/// mutator widget and allows toggling between dark and light modes.
class StateChangerForThemeMutator extends StatefulWidget {
  const StateChangerForThemeMutator({
    super.key,
    required this.child,
    required this.savedThemeMode,
  });

  /// The `final ReactiveApp child;` is a parameter in the `StateChangerForThemeMutator` class
  /// constructor. It represents the child widget that will be wrapped by the
  /// `StateChangerForThemeMutator` widget. The `child` widget will receive the theme mode (either dark
  /// or light) based on the state of the `isDarkMode` variable.
  final ReactiveApp child;

  /// The `final ThemeMode savedThemeMode;` is a parameter in the `StateChangerForThemeMutator` class
  /// constructor. It represents the saved theme mode that will be used to initialize the `isDarkMode`
  /// variable in the `initState` method. The `isDarkMode` variable determines whether the theme mode is
  /// dark or light.
  final ThemeMode savedThemeMode;

  @override
  State<StateChangerForThemeMutator> createState() =>
      StateChangerForThemeMutatorState();
}

class StateChangerForThemeMutatorState
    extends State<StateChangerForThemeMutator> {
  /// The `late` keyword is used to declare a non-nullable variable that will be initialized later. In
  /// this case, `late bool isDarkMode;` is declaring a boolean variable `isDarkMode` that will be
  /// initialized in the `initState` method of the `StateChangerForThemeMutatorState` class. The
  /// `isDarkMode` variable represents whether the theme mode is dark or light.
  late bool isDarkMode;

  /// The function toggles the status of a variable called isDarkMode and saves the updated value in
  /// SharedPreferences.
  Future<void> toggleStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => isDarkMode = !isDarkMode);
    await prefs.setBool('isdarkmode', isDarkMode);
  }

  /// The initState function sets the initial state of the isDarkMode variable based on the
  /// savedThemeMode value.
  @override
  void initState() {
    /// The line `isDarkMode = ThemeMode.dark == widget.savedThemeMode` is comparing the value of
    /// `widget.savedThemeMode` with `ThemeMode.dark`.
    isDarkMode = ThemeMode.dark == widget.savedThemeMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// The `return ThemeMutator(...)` statement is creating an instance of the `ThemeMutator` widget and
    /// returning it as the result of the `build` method.
    return ThemeMutator(
      /// The line `isDarkMode: isDarkMode,` is passing the value of the `isDarkMode` variable to the
      /// `isDarkMode` parameter of the `ThemeMutator` widget. This allows the `ThemeMutator` widget to
      /// access and use the value of `isDarkMode` within its own implementation.
      isDarkMode: isDarkMode,

      /// In the `ThemeMutator` class, the `stateWidget: this` parameter is assigning the current
      /// instance of the `StateChangerForThemeMutatorState` class to the `stateWidget` parameter of the
      /// `ThemeMutator` widget.
      stateWidget: this,

      /// The line `child: widget.child.call(isDarkMode ? ThemeMode.dark : ThemeMode.light),` is calling
      /// the `call` method on the `widget.child` object.
      child: widget.child.call(isDarkMode ? ThemeMode.dark : ThemeMode.light),
    );
  }
}

class ThemeMutator extends InheritedWidget {
  /// The lines `final bool isDarkMode;` and `final StateChangerForThemeMutatorState stateWidget;` are
  /// declaring two final variables in the `ThemeMutator` class.
  final bool isDarkMode;

  final StateChangerForThemeMutatorState stateWidget;

  const ThemeMutator({
    super.key,
    required this.isDarkMode,
    required this.stateWidget,
    required super.child,
  });

  /// The function returns the state widget of the ThemeMutator inherited widget.
  ///
  /// Args:
  ///   context (BuildContext): The `BuildContext` object represents the location of a widget within the
  /// widget tree. It provides access to various properties and methods related to the current build
  /// context.
  static StateChangerForThemeMutatorState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeMutator>()!.stateWidget;

  /// The function returns true if the isDarkMode property of the oldWidget is different from the
  /// isDarkMode property of the current widget.
  ///
  /// Args:
  ///   oldWidget (ThemeMutator): The `oldWidget` parameter is the previous instance of the
  /// `ThemeMutator` widget. It is used to compare the current instance's `isDarkMode` property with the
  /// previous instance's `isDarkMode` property. If there is a difference, it means that the theme has
  /// been updated
  @override
  bool updateShouldNotify(ThemeMutator oldWidget) =>
      oldWidget.isDarkMode != isDarkMode;
}
