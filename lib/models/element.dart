import 'package:flutter/material.dart';

enum Tipo { number, operator, soperator }

class ElementValue {
  String? value;
  Tipo? type;
  IconData? icon;
  ElementValue({this.value, this.type, this.icon});

  ElementValue copyWith(ElementValue old) {
    return ElementValue(
        value: old.value ?? '', type: old.type ?? Tipo.number, icon: old.icon);
  }
}
