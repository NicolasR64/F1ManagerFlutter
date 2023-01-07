import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/ecurie_repo.dart';
import '../../models/Ecurie.dart';

part 'list_ecurie_event.dart';
part 'list_ecurie_state.dart';

class ListEcurieBloc extends Bloc<ListEcurieEvent, ListEcurieState> {
  final EcurieRepository ecurieRepository;

  ListEcurieBloc(this.ecurieRepository) : super(ListEcurieInitialState(listEcurie: List<Ecurie>.from([]))) {
    StreamSubscription<List<Ecurie>> _streamSubscription = ecurieRepository.ecuries.listen((listEcuries) {
      print('_streamSubscription ecuries triggered');
      add(_OnUpdatedListEcurieEvent(ecuries: listEcuries));
      onError: (error) => print(error);
      onDone: (done) => print(done);
    });
    on<_OnUpdatedListEcurieEvent>((event, emit) {
      print('_OnUpdatedListEcurieEvent triggered');
      emit(ListEcurieUpdatedState(listEcurie: event.ecuries));
    });
  }
}
