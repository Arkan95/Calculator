import 'package:calcolatrice/bloc/calculator_bloc.dart';
import 'package:calcolatrice/models/element.dart';
import 'package:calcolatrice/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayView extends StatefulWidget {
  const DisplayView({super.key});

  @override
  State<DisplayView> createState() => _DisplayViewState();
}

class _DisplayViewState extends State<DisplayView> {
  Widget changeMode() {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.dark_mode_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.light_mode_outlined),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget getElementWidget(ElementValue element) {
    if (element.icon == null) {
      return Text(element.value!,
          style: GoogleFonts.quicksand(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: getColor(element.type!)));
    } else {
      return Icon(
        size: 32,
        element.icon!,
        color: getColor(element.type!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: changeMode(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is CalculatorError) {
                  return Container(
                      alignment: Alignment.bottomRight,
                      child: Text("Errore :(",
                          style: GoogleFonts.quicksand(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          )));
                }
                return Container(
                    alignment: Alignment.bottomRight,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      runAlignment: WrapAlignment.center,
                      runSpacing: -15,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...List.generate(
                            state.elements!.length,
                            (int index) =>
                                getElementWidget(state.elements![index]))
                      ],
                    ));
              },
            ),
          ),
        )
      ],
    );
  }
}
