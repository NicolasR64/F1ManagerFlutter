part of 'list_circuit_bloc.dart';

@immutable
abstract class ListCircuitEvent extends Equatable {
  const ListCircuitEvent();

  @override
  List<Object> get props => [];
}

class OnInitializeListCircuitEvent extends ListCircuitEvent {}
