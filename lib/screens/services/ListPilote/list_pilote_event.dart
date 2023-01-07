part of 'list_pilote_bloc.dart';

abstract class ListPiloteEvent extends Equatable {
  const ListPiloteEvent();

  @override
  List<Object> get props => [];
}

class _OnUpdatedListPiloteEvent extends ListPiloteEvent {
  final List<Pilote> pilotes;

  const _OnUpdatedListPiloteEvent({required this.pilotes});

  @override
  List<Object> get props => [pilotes];
}
