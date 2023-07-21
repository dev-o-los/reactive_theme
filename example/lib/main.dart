import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveThemer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
          const Center(child: ReactiveSwitch()),
          const SizedBox(height: 20),
          const Center(child: ReactiveThemeBtn()),
          const SizedBox(height: 20),
          ReactiveMode.isDarkMode(context)
              ? const Text('is darkmode')
              : const Text('is not darkmode'),
        ],
      ),
    );
  }
}
