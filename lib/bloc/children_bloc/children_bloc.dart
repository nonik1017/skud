import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/children_bloc/children_event.dart';
import 'package:skud/bloc/children_bloc/children_state.dart';
import 'package:skud/repositories/repositories.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  final ChildrenRepository childrenRepository;
  // ChildrenBloc({required this.childrenRepository}) : super(childrenEmptyState());

  ChildrenBloc({required this.childrenRepository})
      : super(ChildrenLoadingState());

  @override
  Stream<ChildrenState> mapEventToState(ChildrenEvent event) async* {
    if (event is ChildrenLoadEvent) {
      yield ChildrenLoadingState();

      try {
        final dynamic loadedChildren =
            await ChildrenRepository().getChildrens();
        yield ChildrenLoadedState(loadedChildren: loadedChildren);
      } catch (e) {
        yield ChildrenEmptyState();
      }
    }
  }
}
