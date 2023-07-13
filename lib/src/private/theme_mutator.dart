import 'package:flutter/material.dart';
import 'package:reactive_theme/src/extension/reactive_theme_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateChangerForThemeMutator extends StatefulWidget {
  const StateChangerForThemeMutator({super.key, required this.child});

  final MaterialApp child;

  @override
  State<StateChangerForThemeMutator> createState() =>
      StateChangerForThemeMutatorState();
}

class StateChangerForThemeMutatorState
    extends State<StateChangerForThemeMutator> {
  bool isDarkMode = false;
  final _key = 'isdarkmode';

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) => readData());
    super.initState();
  }

  Future<void> readData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool(_key) ??
          MediaQuery.of(context).platformBrightness == Brightness.dark;
    });
  }

  Future<void> toggleStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => isDarkMode = !isDarkMode);
    await prefs.setBool(_key, isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeMutator(
      isDarkMode: isDarkMode,
      stateWidget: this,
      child: widget.child.themeChanger(
        themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark,
      ),
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
