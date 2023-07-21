import 'package:flutter/material.dart';
import 'package:reactive_theme/reactive_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ReactiveSwitch()),
          SizedBox(height: 20),
          Center(child: ReactiveThemeBtn())
        ],
      ),
    );
  }
}
