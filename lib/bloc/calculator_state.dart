part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorState {
  List<ElementValue>? elements = [];

  CalculatorState({this.elements});
}

final class CalculatorInitial extends CalculatorState {
  CalculatorInitial() : super(elements: []);
}

final class CalculatorAddElement extends CalculatorState {
  CalculatorAddElement({required List<ElementValue> elementi})
      : super(elements: elementi);
}

final class CalculatorOnDelete extends CalculatorState {
  CalculatorOnDelete({required List<ElementValue> elementi})
      : super(elements: elementi);
}

final class CalculatorReset extends CalculatorState {
  CalculatorReset({required List<ElementValue> elementi})
      : super(elements: elementi);
}

final class CalculatorEqual extends CalculatorState {
  CalculatorEqual({required List<ElementValue> elementi})
      : super(elements: elementi);
}

final class CalculatorError extends CalculatorState {
  CalculatorError({required List<ElementValue> elementi})
      : super(elements: elementi);
}
