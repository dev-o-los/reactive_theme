import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';

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
