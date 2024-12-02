import 'package:calcolatrice/bloc/calculator_bloc.dart';
import 'package:calcolatrice/theme.dart';
import 'package:calcolatrice/view/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CalculatorBloc(),
              ),
              /* BlocProvider(
                create: (context) => SubjectBloc(),
              ), */
            ],
            child: CalculatorView(changeTheme: (val) {
              theme = val == 1 ? darkMode() : lightMode();
            }),
          ),
        ),
      ),
    );
  }
}
