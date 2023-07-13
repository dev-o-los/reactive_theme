import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

class ReactiveSwitch extends StatefulWidget {
  const ReactiveSwitch({
    Key? key,
    this.darkmodeIcon = const Icon(Icons.dark_mode),
    this.lightModeIcon = const Icon(Icons.sunny),
    this.activeCol = Colors.grey,
    this.inactiveIconColor = Colors.black87,
  }) : super(key: key);

  final Icon? darkmodeIcon;
  final Icon? lightModeIcon;
  final Color? activeCol;
  final Color? inactiveIconColor;

  @override
  State<ReactiveSwitch> createState() => _ReactiveSwitchState();
}

class _ReactiveSwitchState extends State<ReactiveSwitch> {
  bool value = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      value = ThemeMutator.of(context).isDarkMode;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final thememutator = ThemeMutator.of(context);
    return Switch.adaptive(
      activeColor: widget.activeCol,
      inactiveThumbColor: widget.inactiveIconColor,
      thumbIcon: value
          ? MaterialStateProperty.all(widget.darkmodeIcon)
          : MaterialStateProperty.all(widget.lightModeIcon),
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value;
          thememutator.toggleStatus();
        });
      },
    );
  }
}
