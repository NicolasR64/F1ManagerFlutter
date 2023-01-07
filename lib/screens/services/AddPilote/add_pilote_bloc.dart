import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f1_project_manager/screens/models/Pilote.dart';
import 'package:meta/meta.dart';

import '../../../repositories/pilote_repo.dart';

part 'add_pilote_event.dart';
part 'add_pilote_state.dart';

class AddPiloteBloc extends Bloc<AddPiloteEvent, AddPiloteState> {
  final PiloteRepository piloteRepository;

  AddPiloteBloc(this.piloteRepository) : super(AddPiloteInitialState()) {
    on<OnAddPiloteEvent>((event, emit) async {
      print('OnAddCircuitEvent triggered');
      final Pilote pilote = Pilote(id: 0, nom: event.piloteNom, prenom: event.pilotePrenom, numero: event.piloteNumero, ecurie: event.piloteEcurie, points: event.pilotePoints);
      await piloteRepository.addNewPilote(pilote);
      emit(AddPiloteSuccessState(timestamp: DateTime.now().millisecondsSinceEpoch));
    });
  }
}
