import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../models/Circuit.dart';

part 'list_circuit_event.dart';
part 'list_circuit_state.dart';

class ListCircuitBloc extends Bloc<ListCircuitEvent, ListCircuitState> {

  ListCircuitBloc(List<Circuit> listCircuit) : super(ListCircuitInitialState(listCircuit: listCircuit)) {
    on<ListCircuitEvent>((event, emit) {
      on<OnInitializeListCircuitEvent>((event, emit) {
        List<Circuit> listCircuitModel = listCircuit.map((e) =>
            Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
        emit(ListCircuitInitialState(listCircuit: listCircuitModel));
      });
    });
  }
}
