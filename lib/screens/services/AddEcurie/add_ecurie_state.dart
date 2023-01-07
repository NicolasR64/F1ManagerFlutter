part of 'add_ecurie_bloc.dart';

@immutable
abstract class AddEcurieState extends Equatable{
  const AddEcurieState();

  @override
  List<Object> get props => [];
}

class AddEcurieInitialState extends AddEcurieState {}

class AddEcurieSuccessState extends AddEcurieState {
  final int timestamp;

  const AddEcurieSuccessState({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}
