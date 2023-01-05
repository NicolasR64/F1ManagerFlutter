import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'remove_circuit_event.dart';
part 'remove_circuit_state.dart';

class RemoveCircuitBloc extends Bloc<RemoveCircuitEvent, RemoveCircuitState> {
  RemoveCircuitBloc() : super(RemoveCircuitInitial()) {
    on<RemoveCircuitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
