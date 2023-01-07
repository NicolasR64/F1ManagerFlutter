part of 'add_ecurie_bloc.dart';

@immutable
abstract class AddEcurieEvent extends Equatable{
  const AddEcurieEvent();

  @override
  List<Object> get props => [];
}

class OnAddEcurieEvent extends AddEcurieEvent {
  final String ecurieNom;

  const OnAddEcurieEvent({
    required this.ecurieNom,
  });
}