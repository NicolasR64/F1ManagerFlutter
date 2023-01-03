import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:meta/meta.dart';

part 'add_circuit_event.dart';
part 'add_circuit_state.dart';

class AddCircuitBloc extends Bloc<AddCircuitEvent, AddCircuitState> {
  AddCircuitBloc() : super(AddCircuitInitialStage()) {
    on<OnAddCircuitEvent>((event, emit) {
      print(event.circuitNom);
      print(event.circuitPays);
      // TO DO
      // Check how to perfom id for db
      Circuit circuit = Circuit(id: 0, nom: event.circuitNom, pays: event.circuitPays);
      emit(AddCircuitSuccess(circuit));
    });
  }
}
