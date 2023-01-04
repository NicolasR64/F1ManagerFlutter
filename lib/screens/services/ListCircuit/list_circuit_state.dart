part of 'list_circuit_bloc.dart';

@immutable
abstract class ListCircuitState extends Equatable {
  const ListCircuitState();

  @override
  List<Object> get props => [];
}

class ListCircuitInitialState extends ListCircuitState{
  final List<Circuit> listCircuit;

  const ListCircuitInitialState({required this.listCircuit});

  @override
  List<Object> get props => [listCircuit];
}

class ListCircuitUpdatedState extends ListCircuitState{
  final List<Circuit> listCircuit;

  const ListCircuitUpdatedState({required this.listCircuit});

  @override
  List<Object> get props => [listCircuit];
}
