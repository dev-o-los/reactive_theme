import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateChangerForThemeMutator extends StatefulWidget {
  const StateChangerForThemeMutator({
    super.key,
    required this.child,
    required this.savedThemeMode,
  });

  final ReactiveApp child;
  final ThemeMode savedThemeMode;

  @override
  State<StateChangerForThemeMutator> createState() =>
      StateChangerForThemeMutatorState();
}

class StateChangerForThemeMutatorState
    extends State<StateChangerForThemeMutator> {
  late bool isDarkMode;

  Future<void> toggleStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => isDarkMode = !isDarkMode);
    await prefs.setBool('isdarkmode', isDarkMode);
  }

  @override
  void initState() {
    isDarkMode = ThemeMode.dark == widget.savedThemeMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeMutator(
      isDarkMode: isDarkMode,
      stateWidget: this,
      child: widget.child.call(isDarkMode ? ThemeMode.dark : ThemeMode.light),
    );
  }
}

class ThemeMutator extends InheritedWidget {
  final bool isDarkMode;

  final StateChangerForThemeMutatorState stateWidget;

  const ThemeMutator({
    super.key,
    required this.isDarkMode,
    required this.stateWidget,
    required super.child,
  });

  static StateChangerForThemeMutatorState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeMutator>()!.stateWidget;

  @override
  bool updateShouldNotify(ThemeMutator oldWidget) =>
      oldWidget.isDarkMode != isDarkMode;
}
