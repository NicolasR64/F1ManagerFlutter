part of 'remove_pilote_bloc.dart';

@immutable
abstract class RemovePiloteState extends Equatable {
  const RemovePiloteState();

  @override
  List<Object> get props => [];
}

class RemovePiloteInitial extends RemovePiloteState {}

class RemovePiloteSuccess extends RemovePiloteState {
  final int timestamp;

  const RemovePiloteSuccess({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}