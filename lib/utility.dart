import 'package:calcolatrice/models/element.dart';
import 'package:flutter/material.dart';

List<String> numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

Color getColor(Tipo type) {
  switch (type) {
    case (Tipo.number):
      return Colors.white;
    case (Tipo.operator):
      return const Color.fromRGBO(237, 103, 103, 1);
    case (Tipo.soperator):
      return const Color.fromRGBO(38, 242, 205, 1);
    default:
      return Colors.white;
  }
}
