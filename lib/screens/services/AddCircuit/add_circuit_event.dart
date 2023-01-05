part of 'add_circuit_bloc.dart';

@immutable
abstract class AddCircuitEvent extends Equatable {
  const AddCircuitEvent();

  @override
  List<Object> get props => [];
}

class OnAddCircuitEvent extends AddCircuitEvent {
  final String circuitNom;
  final String circuitPays;

  const OnAddCircuitEvent({
    required this.circuitNom,
    required this.circuitPays,
  });
}
