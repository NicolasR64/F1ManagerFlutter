import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/circuit_repo.dart';

part 'remove_circuit_event.dart';
part 'remove_circuit_state.dart';

class RemoveCircuitBloc extends Bloc<RemoveCircuitEvent, RemoveCircuitState> {
  final CircuitRepository circuitRepository;

  RemoveCircuitBloc(this.circuitRepository) : super(RemoveCircuitInitial()) {
    on<OnRemoveCircuitEvent>((event, emit) async {
      print("OnRemoveCircuitEvent triggered");
      await circuitRepository.removeCircuit(event.id);
      emit(RemoveCircuitSuccess(timestamp: DateTime.now().millisecondsSinceEpoch));
    });
  }
}
