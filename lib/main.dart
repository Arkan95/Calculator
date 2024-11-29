import 'package:calcolatrice/theme.dart';
import 'package:calcolatrice/view/calculator_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = darkMode();
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: SafeArea(
          child: CalculatorView(changeTheme: (val) {
            theme = val == 1 ? darkMode() : lightMode();
          }),
        ),
      ),
    );
  }
}
