abstract class ParentState {}

class ParentEmptyState extends ParentState {}

class ParentLoadingState extends ParentState {}

class ParentLoadedState extends ParentState {
  dynamic loadedParent;

  ParentLoadedState({required this.loadedParent});
}

class ParentErrorState extends ParentState {}
