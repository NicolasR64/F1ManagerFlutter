part of 'list_circuit_bloc.dart';

@immutable
abstract class ListCircuitEvent extends Equatable {
  const ListCircuitEvent();

  @override
  List<Object> get props => [];
}

class _OnUpdatedListCircuitEvent extends ListCircuitEvent {
  final List<Circuit> circuits;

  const _OnUpdatedListCircuitEvent({required this.circuits});

  @override
  List<Object> get props => [circuits];
}
