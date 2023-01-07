part of 'list_pilote_bloc.dart';

abstract class ListPiloteState extends Equatable {
  const ListPiloteState();
}

class ListPiloteInitial extends ListPiloteState {
  @override
  List<Object> get props => [];
}

class ListPiloteInitialState extends ListPiloteState{
  final List<Pilote> listPilote;

  const ListPiloteInitialState({required this.listPilote});

  @override
  List<Object> get props => [listPilote];
}

class ListEcurieUpdatedState extends ListPiloteState{
  final List<Pilote> listPilote;

  const ListPiloteUpdatedState({required this.listPilote});

  @override
  List<Object> get props => [listPilote];
}