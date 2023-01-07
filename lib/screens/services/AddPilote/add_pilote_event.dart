part of 'add_pilote_bloc.dart';

@immutable
abstract class AddPiloteEvent extends Equatable {
  const AddPiloteEvent();

  @override
  List<Object> get props => [];
}

class OnAddPiloteEvent extends AddPiloteEvent {
  final String piloteNom;
  final String pilotePrenom;
  final String piloteNumero;
  final String piloteEcurie;
  final int pilotePoints;

  const OnAddPiloteEvent({
    required this.piloteNom,
    required this.pilotePrenom,
    required this.piloteNumero,
    required this.piloteEcurie,
    required this.pilotePoints,
  });




}
