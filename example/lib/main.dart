import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';

void main() async {
  //Get the saved thememode here
  final thememode = await ReactiveMode.getSavedThemeMode();
  // then pass it to the MyApp()
  runApp(MyApp(savedThemeMode: thememode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.savedThemeMode});

  final ThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    //Wrap with [Reactive Themer] Widget
    return ReactiveThemer(
      savedThemeMode: savedThemeMode,
      builder: (reactiveMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
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
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Change Theme Using these [ReactiveSwitch]
          const Center(child: ReactiveSwitch()),
          const SizedBox(height: 20),
          //Change Theme Using these [ReactiveThemeBtn]
          const Center(child: ReactiveThemeBtn()),
          const SizedBox(height: 20),
          //Accessible Bool for checking isDarkmode and !isDarkmode
          ReactiveMode.isDarkMode(context)
              ? const Text('is darkmode')
              : const Text('is not darkmode changed'),
        ],
      ),
    );
  }
}
