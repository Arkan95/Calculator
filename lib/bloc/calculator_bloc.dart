import 'package:bloc/bloc.dart';
import 'package:calcolatrice/models/element.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  List<ElementValue> elements = [];
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorAddElementPressed>(onAddElement);
    on<CalculatorDeleteElementPressed>(onDeleteElement);
    on<CalculatorEqualElementPressed>(onEqual);
    on<CalculatorResetElementPressed>(onReset);
  }
}

void onAddElement(
    CalculatorAddElementPressed evento, Emitter<CalculatorState> emit) {
  emit(CalculatorAddElement(elements));
}

void onDeleteElement(CalculatorEvent evento, Emitter<CalculatorState> emit) {}

void onEqual(CalculatorEvent evento, Emitter<CalculatorState> emit) {}

void onReset(CalculatorEvent evento, Emitter<CalculatorState> emit) {}
