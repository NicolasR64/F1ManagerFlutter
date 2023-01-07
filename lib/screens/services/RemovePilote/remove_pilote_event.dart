part of 'remove_pilote_bloc.dart';

@immutable
abstract class RemovePiloteEvent extends Equatable {
  const RemovePiloteEvent();

  @override
  List<Object> get props => [];
}

class OnRemovePiloteEvent extends RemovePiloteEvent {
  final int id;

  const OnRemovePiloteEvent({required this.id});

  @override
  List<Object> get props => [id];
}