import 'package:flutter/material.dart';
import 'package:reactive_theme/src/private/constants/constants.dart';
import 'package:reactive_theme/src/private/helper.dart';
import 'package:reactive_theme/src/private/theme_mutator.dart';

class ReactiveThemeBtn extends StatelessWidget {
  /// The `ReactiveThemeBtn()` constructor is defining a class named `ReactiveThemeBtn` with some optional
  /// parameters.
  const ReactiveThemeBtn({
    super.key,
    this.transitionType,
    this.reverse = false,
  })  : _type = '',
        bgColWhenLg = null,
        bgColWhendk = null,
        iconColWhenLg = null,
        iconColWhendk = null,
        child = null,
        lightmodeIcon = null,
        darkmodeIcon = null;

  /// The `ReactiveThemeBtn.editable()` constructor is defining a named constructor within the
  /// `ReactiveThemeBtn` class. This constructor allows you to create an instance of `ReactiveThemeBtn`
  /// with specific parameters for an editable button.
  const ReactiveThemeBtn.editable({
    super.key,
    this.bgColWhenLg = Colors.white,
    this.bgColWhendk = Colors.black87,
    this.iconColWhendk = Colors.white,
    this.iconColWhenLg = Colors.black87,
    this.darkmodeIcon = Icons.dark_mode,
    this.lightmodeIcon = Icons.sunny,
    this.transitionType,
    this.reverse = false,
  })  : _type = 'editable',
        child = null;

  /// The `ReactiveThemeBtn.fromScratch()` constructor is creating an instance of the
  /// `ReactiveThemeBtn` class with specific parameters for a button created from scratch.
  const ReactiveThemeBtn.fromScratch({
    super.key,
    required this.child,
  })  : _type = 'fromScratch',
        bgColWhenLg = null,
        bgColWhendk = null,
        iconColWhenLg = null,
        iconColWhendk = null,
        transitionType = null,
        reverse = null,
        lightmodeIcon = null,
        darkmodeIcon = null;

  /// The `String _type;` is declaring a private variable `_type` of type `String` in the
  /// `ReactiveThemeBtn` class. This variable is used to determine the type of button being
  /// created, such as "editable" or "fromScratch". It is used in the `build` method to
  /// conditionally render different button styles based on the value of `_type`.
  final String _type;

  /// The line `Color? bgColWhenLg;` is declaring a final variable `bgColWhenLg` of type `Color?`.
  /// The `Color?` type indicates that the variable can either hold a valid `Color` value or be null.
  /// This variable is used to store the background color of the button when the device is in light
  /// mode.
  final Color? bgColWhenLg;

  /// The line `Color? bgColWhendk;` is declaring a final variable `bgColWhendk` of type `Color?`.
  /// The `Color?` type indicates that the variable can either hold a valid `Color` value or be null.
  /// This variable is used to store the background color of the button when the device is in dark mode.
  final Color? bgColWhendk;

  /// The line `Color? iconColWhenLg;` is declaring a final variable `iconColWhenLg` of type
  /// `Color?`. The `Color?` type indicates that the variable can either hold a valid `Color` value or
  /// be null. This variable is used to store the icon color of the button when the device is in light
  /// mode.
  final Color? iconColWhenLg;

  /// The line `Color? iconColWhendk;` is declaring a final variable `iconColWhendk` of type
  /// `Color?`. The `Color?` type indicates that the variable can either hold a valid `Color` value or
  /// be null. This variable is used to store the icon color of the button when the device is in dark
  /// mode.
  final Color? iconColWhendk;

  /// The line `Widget Function(Widget child, Animation<double> animation)? transitionType;` is
  /// declaring a final variable `transitionType` of type `Widget Function(Widget child,
  /// Animation<double> animation)?`. This variable is used to define a custom transition animation for
  /// the button. It is a function that takes a `Widget` and an `Animation<double>` as parameters and
  /// returns a `Widget`. The `?` indicates that the variable can be null. If a custom transition
  /// animation is provided, it will be used in the `AnimatedSwitcher` widget in the `build` method to
  /// animate the button when the theme is toggled. If no custom transition animation is provided, a
  /// default rotation transition animation will be used.
  final Widget Function(Widget child, Animation<double> animation)?
      transitionType;

  /// The line `Widget? child;` is declaring a final variable `child` of type `Widget?`. The
  /// `Widget?` type indicates that the variable can either hold a valid `Widget` value or be null. This
  /// variable is used to store the child widget that will be displayed inside the `ReactiveThemeBtn`
  /// widget when it is created using the `ReactiveThemeBtn.fromScratch()` constructor. If a child
  /// widget is provided, it will be rendered inside the `GestureDetector` widget in the `build` method.
  /// If no child widget is provided, an empty container will be rendered instead.
  final Widget? child;

  ///The `reverse` parameter is used to change to icon of the button
  ///if set to `true` the light mode icon and dark mode icon will be reversed.
  final bool? reverse;

  /// The line `IconData? darkmodeIcon;` is declaring a final variable `darkmodeIcon` of type
  /// `IconData?`. The `IconData?` type indicates that the variable can either hold a valid `IconData`
  /// value or be null. This variable is used to store the icon data for the dark mode icon of the
  /// button. It can be set to any valid `IconData` value, such as `Icons.dark_mode`, or it can be left
  /// null if no dark mode icon is needed.
  final IconData? darkmodeIcon;

  /// The line `IconData? lightmodeIcon;` is declaring a final variable `lightmodeIcon` of type
  /// `IconData?`. The `IconData?` type indicates that the variable can either hold a valid `IconData`
  /// value or be null. This variable is used to store the icon data for the light mode icon of the
  /// button. It can be set to any valid `IconData` value, such as `Icons.sunny`, or it can be left null
  /// if no light mode icon is needed.
  final IconData? lightmodeIcon;

  /// This function builds a widget based on the type provided, allowing the user to toggle between dark
  /// and light mode.
  ///
  /// Args:
  ///   context (BuildContext): The `BuildContext` object that represents the location in the widget
  /// tree where this widget is built. It is used to access the `ThemeMutator` object.
  ///
  /// Returns:
  ///   The code is returning a Widget based on the value of the `_type` variable. If `_type` is equal
  /// to 'editable', it returns a Container with a circular shape and an IconButton. If `_type` is equal
  /// to 'fromScratch', it returns the child Widget wrapped in a GestureDetector. Otherwise, it returns
  /// a Container with a circular shape and an Image asset.
  @override
  Widget build(BuildContext context) {
    /// The line `thememutator` is creating a local variable
    /// `thememutator` of type `ThemeMutator` and assigning it the value returned by the `of` method of
    /// the `ThemeMutator` class.
    final thememutator = ThemeMutator.of(context);
    if (_type == 'editable') {
      /// The `return Container(...)` code is creating a container widget with a circular shape and an
      /// `IconButton` inside it. The container's background color is determined by the value of
      /// `thememutator.isDarkMode`. If `isDarkMode` is `true`, the background color will be
      /// `bgColWhendk`, otherwise it will be `bgColWhenLg`.
      return Container(
        decoration: BoxDecoration(
          color: thememutator.isDarkMode ? bgColWhendk : bgColWhenLg,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => thememutator.toggleStatus(),

          /// The line `color: thememutator.isDarkMode ? iconColWhendk : iconColWhenLg,` is setting the
          /// color of the `IconButton` based on the value of `thememutator.isDarkMode`.
          color: thememutator.isDarkMode ? iconColWhendk : iconColWhenLg,

          /// The `AnimatedSwitcher` widget is used to animate the transition between two child
          /// widgets based on a specified duration and transition animation.

          icon: AnimatedSwitcher(
            /// The `duration: const Duration(seconds: 1)` line is setting the duration for the
            /// transition animation in the `AnimatedSwitcher` widget. It specifies that the transition
            /// animation should take 1 second to complete.
            duration: const Duration(seconds: 1),

            /// The line `transitionBuilder: transitionType ?? (child, animation) =>
            /// RotationTransition(turns: animation, child: child,),` is setting the transition
            /// animation for the `AnimatedSwitcher` widget.
            transitionBuilder: transitionType ??
                (child, animation) => RotationTransition(
                      turns: animation,
                      child: child,
                    ),

            /// The `child: thememutator.isDarkMode ? Icon(Icons.dark_mode_outlined, key: UniqueKey(),)
            /// : Icon(Icons.sunny, key: UniqueKey(),),` code is setting the child widget of the
            /// `AnimatedSwitcher` based on the value of `thememutator.isDarkMode`.
            child: thememutator.isDarkMode
                ? Icon(
                    reverse! ? lightmodeIcon : darkmodeIcon,
                    key: UniqueKey(),
                  )
                : Icon(
                    reverse! ? darkmodeIcon : lightmodeIcon,
                    key: UniqueKey(),
                  ),
          ),
        ),
      );
    } else if (_type == 'fromScratch') {
      /// The `GestureDetector` widget is used to detect user gestures on the screen. In this
      /// case, it is used to detect a tap gesture on the child widget and trigger the
      /// `toggleStatus()` method of the `thememutator` object when the tap gesture is detected.
      return GestureDetector(
        child: child!,
        onTap: () => thememutator.toggleStatus(),
      );
    } else {
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Helper.bgiconcol(thememutator.isDarkMode, reverse!),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10.0),
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, animation) => RotationTransition(
              turns: animation,
              child: child,
            ),

            /// The code `thememutator.isDarkMode ? Image.asset('assets/moon-fill.png', package:
            /// 'reactive_theme', key: UniqueKey(),) : Image.asset('assets/sun-fill.png', package:
            /// 'reactive_theme', key: UniqueKey(),)` is conditionally rendering an `Image.asset`
            /// widget based on the value of `thememutator.isDarkMode`.
            child: thememutator.isDarkMode
                ? Image.asset(
                    reverse! ? sunImg : moonImg,
                    package: pkgname,
                    key: UniqueKey(),
                  )
                : Image.asset(
                    reverse! ? moonImg : sunImg,
                    package: pkgname,
                    key: UniqueKey(),
                  ),
          ),
        ),

        /// The `onTap: () => thememutator.toggleStatus(),` line of code is assigning a callback function
        /// to the `onTap` property of the `GestureDetector` widget. This callback function is triggered
        /// when the user taps on the widget.
        onTap: () => thememutator.toggleStatus(),
      );
    }
  }
}
