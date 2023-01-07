part of 'remove_ecurie_bloc.dart';

@immutable
abstract class RemoveEcurieState extends Equatable {
  const RemoveEcurieState();

  @override
  List<Object> get props => [];
}

class RemoveEcurieInitial extends RemoveEcurieState {}

class RemoveEcurieSuccess extends RemoveEcurieState {
  final int timestamp;

  const RemoveEcurieSuccess({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}
