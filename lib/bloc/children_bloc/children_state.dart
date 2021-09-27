abstract class ChildrenState {}

class ChildrenEmptyState extends ChildrenState {}

class ChildrenLoadingState extends ChildrenState {}

class ChildrenLoadedState extends ChildrenState {
  dynamic loadedChildren;

  ChildrenLoadedState({required this.loadedChildren});
}

class ChildrenErrorState extends ChildrenState {}
