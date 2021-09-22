import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/parent_bloc/parent_event.dart';
import 'package:skud/bloc/parent_bloc/parent_state.dart';
import 'package:skud/repositories/repositories.dart';

class ParentBloc extends Bloc<ParentEvent, ParentState> {
  final ParentRepository parentRepository;
  // ParentBloc({required this.parentRepository}) : super(parentEmptyState());

  ParentBloc({required this.parentRepository}) : super(ParentLoadingState());

  @override
  Stream<ParentState> mapEventToState(ParentEvent event) async* {
    if (event is ParentLoadEvent) {
      yield ParentLoadingState();

      try {
        final dynamic loadedParent = await ParentRepository().getParents();
        yield ParentLoadedState(loadedParent: loadedParent);
      } catch (e) {
        yield ParentEmptyState();
      }
    }
  }
}
