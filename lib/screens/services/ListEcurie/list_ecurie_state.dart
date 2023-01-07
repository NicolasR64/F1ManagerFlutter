part of 'list_ecurie_bloc.dart';

@immutable
abstract class ListEcurieState {
  const ListEcurieState();

  @override
  List<Object> get props => [];
}

class ListEcurieInitialState extends ListEcurieState{
  final List<Ecurie> listEcurie;

  const ListEcurieInitialState({required this.listEcurie});

  @override
  List<Object> get props => [listEcurie];
}

class ListEcurieUpdatedState extends ListEcurieState{
  final List<Ecurie> listEcurie;

  const ListEcurieUpdatedState({required this.listEcurie});

  @override
  List<Object> get props => [listEcurie];
}
