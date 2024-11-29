import 'package:calcolatrice/models/element.dart';
import 'package:calcolatrice/widgets/button.dart';
import 'package:flutter/material.dart';

class ButtonsView extends StatelessWidget {
  List<ElementValue> elementsValue;
  ButtonsView({super.key, required this.elementsValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Theme.of(context).primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
            ),
            itemCount: elementsValue.length,
            itemBuilder: (context, index) => ButtonCalculator(
              value: elementsValue[index],
            ),
          ),
        ));
  }
}
