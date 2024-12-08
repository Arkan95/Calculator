import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcolatrice/blocs/calculator/calculator_bloc.dart';
import 'package:calcolatrice/models/element.dart';
import 'package:calcolatrice/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCalculator extends StatelessWidget {
  ElementValue value;

  ButtonCalculator({super.key, required this.value});

  void onPressed(ElementValue value, BuildContext context) {
    if (value.value == "=") {
      context.read<CalculatorBloc>().add(CalculatorEqualElementPressed());
    } else if (value.value == "AC") {
      context.read<CalculatorBloc>().add(CalculatorDeleteElementPressed());
    } else if (value.value == "DEL") {
      context.read<CalculatorBloc>().add(CalculatorResetElementPressed());
    } else {
      context.read<CalculatorBloc>().add(CalculatorAddElementPressed(value));
    }
  }

  Color getColor(Tipo type, BuildContext context) {
    switch (type) {
      case (Tipo.number):
        return Theme.of(context).secondaryHeaderColor;
      case (Tipo.operator):
        return const Color.fromRGBO(237, 103, 103, 1);
      case (Tipo.soperator):
        return const Color.fromRGBO(38, 242, 205, 1);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: theme.scaffoldBackgroundColor,
        disabledBackgroundColor: Colors.red,
      ),
      onPressed: () {
        onPressed(value, context);
      },
      child: value.icon != null
          ? Icon(
              value.icon!,
              color: getColor(value.type!, context),
            )
          : AutoSizeText(
              maxLines: 1,
              minFontSize: 27,
              maxFontSize: 39,
              value.value!,
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  color: getColor(value.type!, context))),
    );
  }
}
