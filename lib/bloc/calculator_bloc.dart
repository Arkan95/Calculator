import 'package:bloc/bloc.dart';
import 'package:calcolatrice/models/element.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorAddElementPressed>(onAddElement);
    on<CalculatorDeleteElementPressed>(onDeleteElement);
    on<CalculatorEqualElementPressed>(onEqual);
    on<CalculatorResetElementPressed>(onReset);
  }

  void onAddElement(
      CalculatorAddElementPressed evento, Emitter<CalculatorState> emit) {
    var list = state.elements;
    ElementValue nuovo = ElementValue().copyWith(evento.newElement);
    //Se è un numero
    if (nuovo.type == Tipo.number) {
      //Se lo stato attuale è CalculatorEqual
      if ((state is CalculatorEqual && nuovo.type == Tipo.number) ||
          state is CalculatorError) {
        //Cancella il risultato precedente e inserisce il nuovo elemento
        list!.clear();
      }
      list!.add(nuovo);
      emit(CalculatorAddElement(elementi: list));
      //Se è un operatore
    } else if (nuovo.type == Tipo.operator) {
      if (state.elements!.isNotEmpty) {
        //Se l'ultimo elemento inserito non è un operatore e se la lista non è vuota

        if (list!.last.type != Tipo.operator) {
          list.add(nuovo);
          emit(CalculatorAddElement(elementi: list));
        }
      }
    } else {
      //Se sono le parentesi
      if (nuovo.value == "( )") {
        int count = 0;

        for (ElementValue el in list!) {
          if (el.value == "(" || el.value == ")") {
            count++;
          }
        }
        if (count % 2 == 0) {
          nuovo.value = "(";
        } else {
          nuovo.value = ")";
        }
      }

      list!.add(nuovo);
      emit(CalculatorAddElement(elementi: list));
    }
  }

  void onDeleteElement(CalculatorEvent evento, Emitter<CalculatorState> emit) {
    var list = state.elements;

    if (list!.isNotEmpty) {
      list.removeLast();
      emit(CalculatorOnDelete(elementi: list));
    }
  }

  void onEqual(CalculatorEvent evento, Emitter<CalculatorState> emit) {
    try {
      if (state.elements!.last.type == Tipo.number) {
        //Creo una lista dinamica di double e string(Le operazioni)
        List<dynamic> listaDaUsare = [];
        List<ElementValue> lista = state.elements!;
        String stringSupport = "";
        for (int i = 0; i < lista.length; i++) {
          if (lista[i].type == Tipo.number) {
            stringSupport += lista[i].value!;
            if (i == lista.length - 1) {
              double temp = double.parse(stringSupport);
              listaDaUsare.add(temp);
              stringSupport = "";
            }
          } else if (lista[i].type == Tipo.operator) {
            double temp = double.parse(stringSupport);
            listaDaUsare.add(temp);
            listaDaUsare.add(lista[i].value);
            stringSupport = "";
          }
        }

        //Cerco prima se ci sono le operazioni di moltiplicazione e divisione
        while (listaDaUsare.contains("X")) {
          int index = listaDaUsare.indexOf("X");
          double subResult =
              (listaDaUsare[index - 1]) * (listaDaUsare[index + 1]);
          //Eseguo le operazioni e tolgo dalla lista l'operazione unendo i due numeri
          listaDaUsare[index] = subResult;
          listaDaUsare.removeAt(index - 1);
          listaDaUsare.removeAt(index);
        }
        //Faccio la stessa cosa per la divisione, somma e differenza
        while (listaDaUsare.contains("÷")) {
          int index = listaDaUsare.indexOf("÷");
          double subResult =
              (listaDaUsare[index - 1]) / (listaDaUsare[index + 1]);
          listaDaUsare[index] = subResult;
          listaDaUsare.removeAt(index - 1);
          listaDaUsare.removeAt(index);
        }

        while (listaDaUsare.contains("+")) {
          int index = listaDaUsare.indexOf("+");
          double subResult =
              (listaDaUsare[index - 1]) + (listaDaUsare[index + 1]);
          listaDaUsare[index] = subResult;
          listaDaUsare.removeAt(index - 1);

          listaDaUsare.removeAt(index);
        }
        while (listaDaUsare.contains("-")) {
          int index = listaDaUsare.indexOf("-");
          double subResult =
              (listaDaUsare[index - 1]) - (listaDaUsare[index + 1]);
          listaDaUsare[index] = subResult;
          listaDaUsare.removeAt(index - 1);
          listaDaUsare.removeAt(index);
        }

        ElementValue result = ElementValue(
            value: listaDaUsare.first.toStringAsFixed(2), type: Tipo.number);
        lista.clear();
        lista.add(result);
        emit(CalculatorEqual(elementi: lista));
      }
    } catch (_) {
      List<ElementValue> vuoto = [];

      emit(CalculatorError(elementi: vuoto));
    }
  }

  void onReset(CalculatorEvent evento, Emitter<CalculatorState> emit) {
    emit(CalculatorInitial());
  }
}
