import 'package:flutter/material.dart';
import '../private/theme_mutator.dart';

class ReactiveThemeBtn extends StatelessWidget {
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

  final Color? bgColWhenLg;

  final Color? bgColWhendk;

  final Color? iconColWhenLg;

  final Color? iconColWhendk;

  final Widget Function(Widget child, Animation<double> animation)?
      transitionType;

  final bool? reverse;

  final IconData? darkmodeIcon;

  final IconData? lightmodeIcon;

  @override
  Widget build(BuildContext context) {
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
