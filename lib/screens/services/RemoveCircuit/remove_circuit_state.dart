part of 'remove_circuit_bloc.dart';

@immutable
abstract class RemoveCircuitState extends Equatable {
  const RemoveCircuitState();

  @override
  List<Object> get props => [];
}

class RemoveCircuitInitial extends RemoveCircuitState {}

class RemoveCircuitSuccess extends RemoveCircuitState {
  final int timestamp;

  const RemoveCircuitSuccess({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}
