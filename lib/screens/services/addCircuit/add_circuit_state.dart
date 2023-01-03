part of 'add_circuit_bloc.dart';

@immutable
abstract class AddCircuitState extends Equatable {
  const AddCircuitState();

  @override
  List<Object> get props => [];
}

class AddCircuitInitialStage extends AddCircuitState {}

class AddCircuitSuccess extends AddCircuitState {
  // TO DO
  // Add data in db
  AddCircuitSuccess(Circuit circuit);
}
