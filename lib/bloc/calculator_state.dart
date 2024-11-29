part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class CalculatorAddElement extends CalculatorState {
  List<ElementValue> elementi;
  CalculatorAddElement(this.elementi);
}

final class CalculatorReset extends CalculatorState {}

final class CalculatorEqual extends CalculatorState {}
