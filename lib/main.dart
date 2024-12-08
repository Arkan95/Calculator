import 'package:calcolatrice/blocs/calculator/calculator_bloc.dart';
import 'package:calcolatrice/blocs/theme/theme_bloc_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculatorBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBlocBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
        builder: (context, state) {
          return MaterialApp(
            theme:
                (state is ThemeBlocDark) ? state.darkMode() : state.lightMode(),
            home: Scaffold(
              body: SafeArea(
                child: CalculatorView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
