import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

// ignore: must_be_immutable
class ReactiveThemeBtn extends StatelessWidget {
  ReactiveThemeBtn({
    super.key,
    this.transitionType,
  });

  ReactiveThemeBtn.editable({
    super.key,
    this.bgColWhenLg = Colors.white,
    this.bgColWhendk = Colors.black87,
    this.iconColWhendk = Colors.white,
    this.iconColWhenLg = Colors.black87,
    this.transitionType,
  }) : type = 'editable';

  ReactiveThemeBtn.fromScratch({
    super.key,
    required this.child,
  }) : type = 'fromScratch';

  String type = '';
  Color? bgColWhenLg;
  Color? bgColWhendk;
  Color? iconColWhenLg;
  Color? iconColWhendk;
  Widget Function(Widget child, Animation<double> animation)? transitionType;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    final thememutator = ThemeMutator.of(context);
    if (type == 'editable') {
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
                    Icons.dark_mode_outlined,
                    key: UniqueKey(),
                  )
                : Icon(
                    Icons.sunny,
                    key: UniqueKey(),
                  ),
          ),
        ),
      );
    } else if (type == 'fromScratch') {
      return GestureDetector(
        child: child!,
        onTap: () => thememutator.toggleStatus(),
      );
    } else {
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: thememutator.isDarkMode ? Colors.black87 : Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10.0),
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, animation) => RotationTransition(
              turns: animation,
              child: child,
            ),
            child: thememutator.isDarkMode
                ? Image.asset(
                    'assets/moon-fill.png',
                    package: 'reactive_theme',
                    key: UniqueKey(),
                  )
                : Image.asset(
                    'assets/sun-fill.png',
                    package: 'reactive_theme',
                    key: UniqueKey(),
                  ),
          ),
        ),
        onTap: () => thememutator.toggleStatus(),
      );
    }
  }
}
