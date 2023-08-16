import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The `StateChangerForThemeMutator` class is a StatefulWidget that manages the state for changing the
/// theme mode of a `MaterialApp` widget.
class StateChangerForThemeMutator extends StatefulWidget {
  const StateChangerForThemeMutator({super.key, required this.child});

  /// The `final MaterialApp child;` is a property of the `StateChangerForThemeMutator` class. It
  /// represents the child widget that will be wrapped by the `StateChangerForThemeMutator` widget. In
  /// this case, it is the `MaterialApp` widget that will be modified to change the theme mode.
  final ReactiveApp child;

  @override
  State<StateChangerForThemeMutator> createState() =>
      StateChangerForThemeMutatorState();
}

class StateChangerForThemeMutatorState
    extends State<StateChangerForThemeMutator> {
  /// The line `bool isDarkMode = false;` is declaring a boolean variable named `isDarkMode` and
  /// initializing it with the value `false`. This variable is used to keep track of the current theme
  /// mode (dark or light) in the `StateChangerForThemeMutator` widget.
  bool isDarkMode = false;

  /// The line `_key` is declaring a constant variable named `_key` and assigning
  /// it the value `'isdarkmode'`. This variable is used as the key to store and retrieve the theme mode
  /// (dark or light) in the shared preferences.
  final _key = 'isdarkmode';

  /// The initState function delays the execution of the readData function until after the current frame
  /// is finished rendering.
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => readData());
    super.initState();
  }

  /// The function reads data from SharedPreferences and updates the isDarkMode variable based on the
  /// stored value or the platform's brightness.
  Future<void> readData() async {
    /// The line `prefs` is retrieving an instance of the
    /// `SharedPreferences` class.
    final prefs = await SharedPreferences.getInstance();

    /// The `setState(() { ... })` method is used to update the state of the
    /// `StateChangerForThemeMutator` widget. In this case, it is updating the `isDarkMode` variable
    /// based on the stored value in the `SharedPreferences` or the platform's brightness.
    setState(() {
      isDarkMode = prefs.getBool(_key) ??
          Theme.of(context).brightness == Brightness.dark;
    });
  }

  /// The function toggles the status of a variable called isDarkMode and saves the updated value to
  /// SharedPreferences.
  Future<void> toggleStatus() async {
    /// The line `prefs` is retrieving an instance of the
    /// `SharedPreferences` class. `SharedPreferences` is a package that allows you to store and
    /// retrieve key-value pairs persistently across app restarts. In this case, it is used to store and
    /// retrieve the theme mode (dark or light) of the app. The `getInstance()` method returns a
    /// `Future` that completes with the `SharedPreferences` instance, so `await` is used to wait for
    /// the instance to be retrieved before continuing execution.
    final prefs = await SharedPreferences.getInstance();

    /// The line `setState(() => isDarkMode = !isDarkMode);` is updating the state of the
    /// `StateChangerForThemeMutator` widget. It toggles the value of the `isDarkMode` variable by
    /// negating its current value. This means that if `isDarkMode` is `true`, it will be set to
    /// `false`, and if `isDarkMode` is `false`, it will be set to `true`. The `setState()` method is
    /// used to notify the framework that the state has changed and triggers a rebuild of the widget
    /// tree.
    setState(() => isDarkMode = !isDarkMode);

    /// `await prefs.setBool(_key, isDarkMode);` is saving the updated value of the `isDarkMode`
    /// variable to the `SharedPreferences`.
    await prefs.setBool(_key, isDarkMode);
  }

  /// The function builds a widget that allows for toggling between light and dark themes.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext is a reference to the location of a widget within the
  /// widget tree. It is used to access various properties and methods related to the current widget and
  /// its ancestors.
  ///
  /// Returns:
  ///   The `build` method is returning a `ThemeMutator` widget.
  @override
  Widget build(BuildContext context) {
    return ThemeMutator(
      isDarkMode: isDarkMode,

      /// In the `ThemeMutator` class, the `stateWidget: this` line is assigning the current instance of
      /// the `StateChangerForThemeMutatorState` class to the `stateWidget` property of the
      /// `ThemeMutator` widget.
      stateWidget: this,

      child: widget.child.call(isDarkMode ? ThemeMode.dark : ThemeMode.light),
    );
  }
}

/// The `ThemeMutator` class is an inherited widget that allows for changing the theme of the app and
/// notifies its descendants when the theme changes.
class ThemeMutator extends InheritedWidget {
  /// The line `bool isDarkMode;` is declaring a boolean variable named `isDarkMode`. This
  /// variable is used to keep track of the current theme mode (dark or light) in the
  /// `StateChangerForThemeMutator` widget. It is marked as `final`, which means its value cannot be
  /// changed once it is assigned.
  final bool isDarkMode;

  /// The line `StateChangerForThemeMutatorState stateWidget;` is declaring a final variable named
  /// `stateWidget` of type `StateChangerForThemeMutatorState`. This variable is used to store an
  /// instance of the `StateChangerForThemeMutatorState` class, which represents the state of the
  /// `StateChangerForThemeMutator` widget.
  final StateChangerForThemeMutatorState stateWidget;

  /// The `const ThemeMutator({ ... })` is a constructor for the `ThemeMutator` class. It takes several
  /// parameters:
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
