part of 'add_circuit_bloc.dart';

@immutable
abstract class AddCircuitState extends Equatable {
  const AddCircuitState();

  @override
  List<Object> get props => [];
}

class AddCircuitInitialState extends AddCircuitState {}

class AddCircuitSuccessState extends AddCircuitState {
  final int timestamp;

  const AddCircuitSuccessState({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}
