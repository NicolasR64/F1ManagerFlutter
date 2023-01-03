import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_circuit_event.dart';
part 'add_circuit_state.dart';

class AddCircuitBloc extends Bloc<AddCircuitEvent, AddCircuitState> {
  AddCircuitBloc() : super(AddCircuitInitial()) {
    on<AddCircuitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
