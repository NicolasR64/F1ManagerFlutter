import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../repositories/ecurie_repo.dart';
import '../../models/Ecurie.dart';

part 'add_ecurie_event.dart';
part 'add_ecurie_state.dart';

class AddEcurieBloc extends Bloc<AddEcurieEvent, AddEcurieState> {
  final EcurieRepository ecurieRepository;

  AddEcurieBloc(this.ecurieRepository) : super(AddEcurieInitialState()) {
    on<OnAddEcurieEvent>((event, emit) async {
      print('OnAddCircuitEvent triggered');
      final Ecurie ecurie = Ecurie(id: 0, nom: event.ecurieNom);
      await ecurieRepository.addNewEcurie(ecurie);
      emit(AddEcurieSuccessState(timestamp: DateTime.now().millisecondsSinceEpoch));
    });
  }
}
