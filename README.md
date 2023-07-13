# reactive_theme

This package allows you to change theme of the app to light and dark mode and vice versa
with the help of `ReactiveThemer` and `ReactiveThemeBtn` widgets.

Supports Android, iOS, Web, Mac, Linux and Windows.

## What it can do

You can easily toogle between light mode and dark mode using the `ReactiveThemeBtn` provided by
this package.

<!-- add gif here -->

## Install it

You can install simple_sizer using the below command:

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

<span style="color: green"> Some green text </span>

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
`ReactiveThemeBtn` Widget

```dart
  ReactiveThemeBtn()
```

Thre are two more named constructors you can use if you don't like the default
`ReactiveThemeBtn`, they are --

```dart
  //Helps you modify the original button
  ReactiveThemeBtn.editable()
```

and

```dart
  //Create your own button
  //It takes widget as a parameter
  //So , you can make anything you want to
  //like a switcher , floating action button etc...
  ReactiveThemeBtn.fromScratch()
```
