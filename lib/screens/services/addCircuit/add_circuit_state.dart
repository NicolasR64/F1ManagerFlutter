part of 'add_circuit_bloc.dart';

@immutable
abstract class AddCircuitState extends Equatable {
  const AddCircuitState();

  @override
  List<Object> get props => [];
}

class AddCircuitInitialStage extends AddCircuitState {}
