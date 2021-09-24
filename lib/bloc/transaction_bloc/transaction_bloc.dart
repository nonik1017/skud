import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/transaction_bloc/transaction_event.dart';
import 'package:skud/bloc/transaction_bloc/transaction_state.dart';
import 'package:skud/repositories/repositories.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;
  final UserRepository userRepository;
  // TransactionBloc({required this.transactionRepository}) : super(TransactionEmptyState());

  TransactionBloc(
      {required this.transactionRepository, required this.userRepository})
      : super(TransactionLoadingState());

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionLoadEvent) {
      yield TransactionLoadingState();

      try {
        final dynamic loadedUser = await userRepository.getUser();
        final dynamic loadedTransaction =
            await TransactionRepository().getTransactions();
        yield TransactionLoadedState(
          loadedTransaction: loadedTransaction,
          loadedUser: loadedUser,
        );
      } catch (e) {
        yield TransactionEmptyState();
      }
    }

    if (event is TransactionFilterButtonPressed) {
      yield TransactionLoadingState();
      try {
        final dynamic loadedUser = await userRepository.getUser();
        final dynamic fromDateParts = event.selectedFromDate.split(' ');
        final dynamic toDateParts = event.selectedToDate.split(' ');
        final dynamic loadedTransaction =
            await transactionRepository.getFilteredTransactions(
          fromDateParts[0],
          toDateParts[0],
        );
        yield TransactionLoadedState(
          loadedTransaction: loadedTransaction,
          loadedUser: loadedUser,
        );
      } catch (e) {
        yield TransactionEmptyState();
      }
    }
  }
}
