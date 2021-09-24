import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_event.dart';
import 'package:skud/bloc/visit_bloc/visit_state.dart';
import 'package:skud/repositories/repositories.dart';

class ChildVisitBloc extends Bloc<VisitEvent, VisitState> {
  final ChildVisitRepository childVisitRepository;
  final UserRepository userRepository;
  // VisitBloc({required this.visitRepository}) : super(VisitEmptyState());

  ChildVisitBloc({
    required this.childVisitRepository,
    required this.userRepository,
  }) : super(VisitLoadingState());

  @override
  Stream<VisitState> mapEventToState(VisitEvent event) async* {
    if (event is VisitLoadEvent) {
      yield VisitLoadingState();

      try {
        final dynamic loadedChildVisit =
            await childVisitRepository.getChildVisits();
        final dynamic loadedUser = await userRepository.getUser();
        yield VisitLoadedState(
          loadedVisit: loadedChildVisit,
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
        final dynamic loadedChildVisit =
            await childVisitRepository.getFilteredChildVisits(
          fromDateParts[0],
          toDateParts[0],
        );
        yield VisitLoadedState(
          loadedVisit: loadedChildVisit,
          loadedUser: loadedUser,
        );
      } catch (e) {
        yield VisitEmptyState();
      }
    }
  }
}
