import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../repositories/pilote_repo.dart';

part 'remove_pilote_event.dart';
part 'remove_pilote_state.dart';

class RemovePiloteBloc extends Bloc<RemovePiloteEvent, RemovePiloteState> {
  final PiloteRepository piloteRepository;

  RemovePiloteBloc(this.piloteRepository) : super(RemovePiloteInitial()) {
    on<RemovePiloteEvent>((event, emit) async{
      print("OnRemoveEcurieEvent triggered");
      await piloteRepository.removePilote(event.id);
      emit(RemovePiloteSuccess(timestamp: DateTime.now().millisecondsSinceEpoch));
    });
  }
}
