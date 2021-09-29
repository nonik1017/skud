abstract class VisitState {}

class VisitEmptyState extends VisitState {}

class VisitLoadingState extends VisitState {}

class VisitLoadedState extends VisitState {
  dynamic loadedVisit;
  dynamic loadedUser;

  VisitLoadedState({required this.loadedVisit, required this.loadedUser});
}

class VisitErrorState extends VisitState {}
