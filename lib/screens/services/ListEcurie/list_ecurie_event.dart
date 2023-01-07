part of 'list_ecurie_bloc.dart';

@immutable
abstract class ListEcurieEvent extends Equatable {
  const ListEcurieEvent();

@override
List<Object> get props => [];
}

class _OnUpdatedListEcurieEvent extends ListEcurieEvent {
  final List<Ecurie> ecuries;

  const _OnUpdatedListEcurieEvent({required this.ecuries});

  @override
  List<Object> get props => [ecuries];
}
