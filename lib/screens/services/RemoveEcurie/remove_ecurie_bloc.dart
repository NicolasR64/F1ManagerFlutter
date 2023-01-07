import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/ecurie_repo.dart';

part 'remove_ecurie_event.dart';
part 'remove_ecurie_state.dart';

class RemoveEcurieBloc extends Bloc<RemoveEcurieEvent, RemoveEcurieState> {
  final EcurieRepository ecurieRepository;

  RemoveEcurieBloc(this.ecurieRepository) : super(RemoveEcurieInitial()) {
    on<OnRemoveEcurieEvent>((event, emit) async {
      print("OnRemoveEcurieEvent triggered");
      await ecurieRepository.removeEcurie(event.id);
      emit(RemoveEcurieSuccess(timestamp: DateTime.now().millisecondsSinceEpoch));
    });
  }
}
