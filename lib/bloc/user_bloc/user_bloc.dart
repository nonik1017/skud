import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/user_bloc/user_event.dart';
import 'package:skud/bloc/user_bloc/user_state.dart';
import 'package:skud/models/user.dart';
import 'package:skud/repositories/repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  // UserBloc({required this.userRepository}) : super(UserEmptyState());

  UserBloc({required this.userRepository}) : super(UserLoadingState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();

      try {
        final User loadedUser = await userRepository.getUser();
        print('-----loadedUser: $loadedUser-----');
        yield UserLoadedState(loadedUser: loadedUser);
      } catch (_) {
        yield UserEmptyState();
      }
    }
  }
}
