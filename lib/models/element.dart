import 'package:flutter/material.dart';

enum Type { number, operator, soperator }

class ElementValue {
  String? value;
  Type? type;
  IconData? icon;
  ElementValue({this.value, this.type, this.icon});

  ElementValue copyWith(ElementValue old) {
    return ElementValue(
        value: old.value ?? '', type: old.type ?? Type.number, icon: old.icon);
  }
}
