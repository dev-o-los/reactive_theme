# reactive_theme

This package allows you to change theme of the app to light and dark mode and vice versa
with the help of `ReactiveThemer` and `ReactiveThemeBtn` widgets.

Supports Android, iOS, Web, Mac, Linux and Windows.

## What it can do

You can easily toogle between light mode and dark mode using the `ReactiveThemeBtn` provided by
this package.

<img src="https://github.com/dev-o-los/reactive_theme/raw/main/gifs/reactive_theme_example.gif">

You need not to worry about preserving the theme using [shared_preferences](https://pub.dev/packages/shared_preferences) as it already preserves the theme state of the app automatically using `shared_preferences` package.😎

## Install it

You can install reactive_theme using the below command:

```css
 $ flutter pub add reactive_theme
```

## Import it

Now in your `dart` file you can use:

```dart
import 'package:reactive_theme/reactive_theme.dart';
```

## Usage

Wrap the `MaterialApp` widget with `ReactiveThemer` and nothing else.

⚠️ [Important]

`ReactiveThemer` must be the topmost widget in the widget tree

```dart
ReactiveThemer(
  child: MaterialApp(
    title: 'Reactive Theme Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ),
);
```

Now you change toggle between dark and light mode easily from anywhere by using
`ReactiveThemeBtn` or `ReactiveSwitch` Widget.

## ReactiveThemeBtn

ReactiveThemeBtn has one simple and two named constructors , they are -

- `ReactiveThemeBtn.editable()`

  | Parameters     | Description                                                  |
  | -------------- | ------------------------------------------------------------ |
  | bgColWhenLg    | sets the background color of the btn when in light mode      |
  | bgColWhendk    | sets the background color of the btn when in dark mode       |
  | iconColWhendk  | sets the icon color of the btn when in dark mode             |
  | iconColWhenLg  | sets the icon color of the btn when in light mode            |
  | transitionType | sets the transition animation for btn , rotation , scale etc |

- `ReactiveThemeBtn.fromScratch()`

It takes widget as a parameter so you can create anything you want from this constructor

## ReactiveSwitch

A simple adpative switch for toggling thememode

| Parameters        | Description                                           |
| ----------------- | ----------------------------------------------------- |
| darkmodeIcon      | sets icon for switch when in dark mode                |
| lightModeIcon     | sets icon for switch when in dark mode                |
| activeCol         | The color to use when this switch is on               |
| inactiveIconColor | The color to use on the thumb when this switch is off |
