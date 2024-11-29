import 'package:calcolatrice/models/element.dart';
import 'package:calcolatrice/view/buttons_view.dart';
import 'package:calcolatrice/view/display_view.dart';
import 'package:flutter/material.dart';
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
    List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    elements.add(ElementValue(value: "AC", type: Type.soperator));
    elements.add(ElementValue(value: "±", type: Type.soperator));
    elements.add(ElementValue(
        value: "%", type: Type.soperator, icon: Icons.percent_outlined));
    elements.add(ElementValue(value: "÷", type: Type.operator));
    for (int i = 7; i < 10; i++) {
      elements.add(ElementValue(value: "${numbers[i]}", type: Type.number));
    }
    elements
        .add(ElementValue(value: "X", type: Type.operator, icon: Icons.close));
    for (int i = 4; i < 7; i++) {
      elements.add(ElementValue(value: "${numbers[i]}", type: Type.number));
    }
    elements
        .add(ElementValue(value: "-", type: Type.operator, icon: Icons.remove));
    for (int i = 1; i < 4; i++) {
      elements.add(ElementValue(value: "${numbers[i]}", type: Type.number));
    }
    elements
        .add(ElementValue(value: "+", type: Type.operator, icon: Icons.add));
    elements
        .add(ElementValue(value: "DEL", type: Type.number, icon: Icons.replay));
    elements.add(ElementValue(value: "${numbers[0]}", type: Type.number));
    elements.add(ElementValue(value: ".", type: Type.number));
    elements.add(
        ElementValue(value: "=", type: Type.operator, icon: Symbols.equal));
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
