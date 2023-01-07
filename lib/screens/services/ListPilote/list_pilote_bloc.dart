import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f1_project_manager/screens/models/Pilote.dart';

import '../../../repositories/pilote_repo.dart';

part 'list_pilote_event.dart';
part 'list_pilote_state.dart';

class ListPiloteBloc extends Bloc<ListPiloteEvent, ListPiloteState> {
  final PiloteRepository piloteRepository;

  ListPiloteBloc(this.piloteRepository) : super(ListPiloteInitial(listPilote: List<Pilote>.from([]))) {
    StreamSubscription<List<Pilote>> _streamSubscription = piloteRepository.pilotes.listen((listPilote) {
      print('_streamSubscription pilotes triggered');
      add(_OnUpdatedListPiloteEvent(pilotes: listPilote));
      onError: (error) => print(error);
      onDone: (done) => print(done);
    });
    on<_OnUpdatedListPiloteEvent>((event, emit) {
      print('_OnUpdatedListEcurieEvent triggered');
      emit(ListPiloteUpdatedState(listPilote: event.pilotes));
    });
  }
}
