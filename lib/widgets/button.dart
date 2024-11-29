import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcolatrice/models/element.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCalculator extends StatelessWidget {
  ElementValue value;

  ButtonCalculator({super.key, required this.value});

  Color getColor(Type type) {
    switch (type) {
      case (Type.number):
        return Colors.white;
      case (Type.operator):
        return const Color.fromRGBO(237, 103, 103, 1);
      case (Type.soperator):
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
      onPressed: () {},
      child: value.icon != null
          ? Icon(
              value.icon!,
              color: getColor(value.type!),
            )
          : AutoSizeText(
              maxLines: 1,
              minFontSize: 21,
              maxFontSize: 32,
              value.value!,
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold, color: getColor(value.type!))),
    );
  }
}
