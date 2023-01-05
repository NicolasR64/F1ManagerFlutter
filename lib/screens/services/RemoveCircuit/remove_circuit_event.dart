part of 'remove_circuit_bloc.dart';

@immutable
abstract class RemoveCircuitEvent extends Equatable {
  const RemoveCircuitEvent();

  @override
  List<Object> get props => [];
}

class OnRemoveCircuitEvent extends RemoveCircuitEvent {
  final int id;

  const OnRemoveCircuitEvent({required this.id});

  @override
  List<Object> get props => [id];
}
