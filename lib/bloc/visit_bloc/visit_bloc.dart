import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_event.dart';
import 'package:skud/bloc/visit_bloc/visit_state.dart';
import 'package:skud/repositories/repositories.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final VisitRepository visitRepository;
  // VisitBloc({required this.visitRepository}) : super(VisitEmptyState());

  VisitBloc({required this.visitRepository}) : super(VisitLoadingState());

  @override
  Stream<VisitState> mapEventToState(VisitEvent event) async* {
    if (event is VisitLoadEvent) {
      yield VisitLoadingState();

      try {
        final dynamic loadedVisit = await visitRepository.getVisits();
        yield VisitLoadedState(loadedVisit: loadedVisit);
      } catch (_) {
        yield VisitEmptyState();
      }
    }
  }
}
