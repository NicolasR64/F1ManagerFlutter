import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../repositories/circuit_repo.dart';
import '../../models/Circuit.dart';

part 'list_circuit_event.dart';
part 'list_circuit_state.dart';



class ListCircuitBloc extends Bloc<ListCircuitEvent, ListCircuitState> {
  final CircuitRepository circuitRepository;

  ListCircuitBloc(this.circuitRepository) : super(ListCircuitInitialState(listCircuit: List<Circuit>.from([]))) {
    circuitRepository.circuits.listen((listCircuits) {
      print(' stream triggerd : $listCircuits');
      add(_OnUpdatedListCircuitEvent(circuits: listCircuits));
    });
    on<_OnUpdatedListCircuitEvent>((event, emit) {
      print('event : $event');
      emit(ListCircuitUpdatedState(listCircuit: event.circuits));
    });
  }
}
