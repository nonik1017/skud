import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_event.dart';
import 'package:skud/bloc/visit_bloc/visit_state.dart';
import 'package:skud/repositories/repositories.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final VisitRepository visitRepository;
  final UserRepository userRepository;
  // VisitBloc({required this.visitRepository}) : super(VisitEmptyState());

  VisitBloc({required this.visitRepository, required this.userRepository})
      : super(VisitLoadingState());

  @override
  Stream<VisitState> mapEventToState(VisitEvent event) async* {
    if (event is VisitLoadEvent) {
      yield VisitLoadingState();

      try {
        final dynamic loadedVisit = await visitRepository.getVisits();
        final dynamic loadedUser = await userRepository.getUser();
        yield VisitLoadedState(
          loadedVisit: loadedVisit,
          loadedUser: loadedUser,
        );
      } catch (_) {
        yield VisitEmptyState();
      }
    }

    if (event is VisitFilterButtonPressed) {
      yield VisitLoadingState();
      try {
        final dynamic loadedUser = await userRepository.getUser();
        final dynamic fromDateParts = event.selectedFromDate.split(' ');
        final dynamic toDateParts = event.selectedToDate.split(' ');
        final dynamic loadedVisit = await visitRepository.getFilteredVisits(
          fromDateParts[0],
          toDateParts[0],
        );
        yield VisitLoadedState(
          loadedVisit: loadedVisit,
          loadedUser: loadedUser,
        );
      } catch (e) {
        yield VisitEmptyState();
      }
    }
  }
}
