import 'dart:async';

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
    StreamSubscription<List<Circuit>> _streamSubscription = circuitRepository.circuits.listen((listCircuits) {
      print('_streamSubscription circuits triggered');
      add(_OnUpdatedListCircuitEvent(circuits: listCircuits));
      onError: (error) => print(error);
      onDone: (done) => print(done);
    });
    on<_OnUpdatedListCircuitEvent>((event, emit) {
      print('_OnUpdatedListCircuitEvent triggered');
      emit(ListCircuitUpdatedState(listCircuit: event.circuits));
    });
  }
}
