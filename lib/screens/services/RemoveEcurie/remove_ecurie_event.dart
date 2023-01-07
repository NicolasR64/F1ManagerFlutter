part of 'remove_ecurie_bloc.dart';

@immutable
abstract class RemoveEcurieEvent extends Equatable{
  const RemoveEcurieEvent();

  @override
  List<Object> get props => [];
}

class OnRemoveEcurieEvent extends RemoveEcurieEvent {
  final int id;

  const OnRemoveEcurieEvent({required this.id});

  @override
  List<Object> get props => [id];
}
