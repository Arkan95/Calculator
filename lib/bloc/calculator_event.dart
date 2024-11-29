part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent {}

//Aggiungi un numero
final class CalculatorAddElementPressed extends CalculatorEvent {
  ElementValue newElement;
  CalculatorAddElementPressed(this.newElement);
}

//Cancella elemento
final class CalculatorDeleteElementPressed extends CalculatorEvent {}

//Premere uguale
final class CalculatorEqualElementPressed extends CalculatorEvent {}

//Premere reset
final class CalculatorResetElementPressed extends CalculatorEvent {}

//Premere operatore speciale
final class CalculatorSpecialElementPressed extends CalculatorEvent {}
