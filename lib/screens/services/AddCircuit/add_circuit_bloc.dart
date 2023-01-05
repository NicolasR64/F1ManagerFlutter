import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:meta/meta.dart';

import '../../../repositories/circuit_repo.dart';

part 'add_circuit_event.dart';
part 'add_circuit_state.dart';

class AddCircuitBloc extends Bloc<AddCircuitEvent, AddCircuitState> {
  final CircuitRepository circuitRepository;

  AddCircuitBloc(this.circuitRepository) : super(AddCircuitInitialState()) {
    on<OnAddCircuitEvent>((event, emit) async {
      print('OnAddCircuitEvent triggered');
      final Circuit circuit = Circuit(id: 0, nom: event.circuitNom, pays: event.circuitPays);
      await circuitRepository.addNewCircuit(circuit);
      emit(AddCircuitSuccessState(timestamp: DateTime.now().millisecondsSinceEpoch));
    });
  }
}
