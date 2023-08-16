# reactive_theme

This package allows you to change theme of the app to light and dark mode and vice versa
with the help of `ReactiveThemer` and `ReactiveThemeBtn` widgets.

Supports Android, iOS, Web, Mac, Linux and Windows.

## What it can do

You can easily toogle between light mode and dark mode using the `ReactiveThemeBtn` or `ReactiveSwitch` provided by
this package.

<img src="https://github.com/dev-o-los/reactive_theme/raw/main/gifs/reactive_theme_example.gif" width=400>

You need not to worry about preserving the theme using [shared_preferences](https://pub.dev/packages/shared_preferences) as it already preserves the theme state of the app automatically using `shared_preferences` package.😎

 <p align="center">
  <br />
  <br />
<a href="https://www.buymeacoffee.com/k.utkarsh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
</p>

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

```dart
void main() async {
  // Get the saved thememode here
  final thememode = await ReactiveMode.getSavedThemeMode();
  // then pass it to the MyApp()
  runApp(MyApp(savedThemeMode: thememode));
}
```

Wrap the `MaterialApp` widget with `ReactiveThemer` and nothing else.

⚠️ [Important]

`ReactiveThemer` must be the topmost widget in the widget tree

```dart
// Wrap with [Reactive Themer] Widget
ReactiveThemer(
  // loads the saved thememode.
  // If null then ThemeMode.system is used
  savedThemeMode: savedThemeMode,
  builder: (reactiveMode) => MaterialApp(
    debugShowCheckedModeBanner: false,
    //Pass the reactiveMode to the themeMode parameter in order to toggle theme
    themeMode: reactiveMode,
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

## ReactiveMode

You can check whether your ui is in darkmode or lightmode using the `isDarkMode` function which returns you a bool.
Simply Call

```dart
// Returns a boolean value
ReactiveMode.isDarkMode(context);
```

Now you change toggle between dark and light mode easily from anywhere by using
`ReactiveThemeBtn` or `ReactiveSwitch` Widget.

## ReactiveThemeBtn

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

<img src="https://github.com/dev-o-los/reactive_theme/raw/pre-release/gifs/reactive_switch_example.gif" width=400>

| Parameters        | Description                                           |
| ----------------- | ----------------------------------------------------- |
| darkmodeIcon      | sets icon for switch when in dark mode                |
| lightModeIcon     | sets icon for switch when in dark mode                |
| activeCol         | The color to use when this switch is on               |
| inactiveIconColor | The color to use on the thumb when this switch is off |
