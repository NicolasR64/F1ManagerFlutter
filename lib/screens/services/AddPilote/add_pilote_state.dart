part of 'add_pilote_bloc.dart';

@immutable
abstract class AddPiloteState extends Equatable{
  const AddPiloteState();
  @override
  List<Object> get props => [];
}

class AddPiloteInitialState extends AddPiloteState {}

class AddPiloteSuccessState extends AddPiloteState {
  final int timestamp;

  const AddPiloteSuccessState({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}
