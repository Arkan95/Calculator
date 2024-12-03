import 'package:calcolatrice/models/element.dart';
import 'package:calcolatrice/utility.dart';
import 'package:calcolatrice/view/buttons_view.dart';
import 'package:calcolatrice/view/display_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CalculatorView extends StatefulWidget {
  Function(int val)? changeTheme;

  CalculatorView({super.key, this.changeTheme});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  List<ElementValue> elements = [];
  @override
  void initState() {
    // TODO: implement initState
    initValues();
    super.initState();
  }

  void initValues() {
    elements.add(ElementValue(
        value: "AC", type: Tipo.soperator, icon: FontAwesomeIcons.deleteLeft));
    elements.add(ElementValue(
      value: "( )",
      type: Tipo.soperator,
    ));
    elements.add(ElementValue(
        value: "±", type: Tipo.soperator, icon: FontAwesomeIcons.plusMinus));
    elements.add(ElementValue(
        value: "÷", type: Tipo.operator, icon: FontAwesomeIcons.divide));
    for (int i = 7; i < 10; i++) {
      elements.add(ElementValue(value: numbers[i], type: Tipo.number));
    }
    elements.add(ElementValue(
        value: "X", type: Tipo.operator, icon: FontAwesomeIcons.xmark));
    for (int i = 4; i < 7; i++) {
      elements.add(ElementValue(value: numbers[i], type: Tipo.number));
    }
    elements.add(ElementValue(
        value: "-", type: Tipo.operator, icon: FontAwesomeIcons.minus));
    for (int i = 1; i < 4; i++) {
      elements.add(ElementValue(value: numbers[i], type: Tipo.number));
    }
    elements.add(ElementValue(
        value: "+", type: Tipo.operator, icon: FontAwesomeIcons.plus));
    elements
        .add(ElementValue(value: "DEL", type: Tipo.number, icon: Icons.replay));
    elements.add(ElementValue(value: numbers[0], type: Tipo.number));
    elements.add(ElementValue(value: ".", type: Tipo.number));
    elements.add(ElementValue(
        value: "=", type: Tipo.operator, icon: FontAwesomeIcons.equals));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Flexible(flex: 2, fit: FlexFit.tight, child: DisplayView()),
        Flexible(flex: 4, child: ButtonsView(elementsValue: elements))
      ],
    );
  }
}
