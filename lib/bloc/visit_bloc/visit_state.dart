abstract class VisitState {}

class VisitEmptyState extends VisitState {}

class VisitLoadingState extends VisitState {}

class VisitLoadedState extends VisitState {
  dynamic loadedVisit;

  VisitLoadedState({required this.loadedVisit});
}

class VisitErrorState extends VisitState {}
