import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/transaction_bloc/transaction_event.dart';
import 'package:skud/bloc/transaction_bloc/transaction_state.dart';
import 'package:skud/repositories/repositories.dart';

class ChildTransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ChildTransactionRepository childTransactionRepository;
  final UserRepository userRepository;
  // TransactionBloc({required this.transactionRepository}) : super(TransactionEmptyState());

  ChildTransactionBloc(
      {required this.childTransactionRepository, required this.userRepository})
      : super(TransactionLoadingState());

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionLoadEvent) {
      yield TransactionLoadingState();

      try {
        final dynamic loadedUser = await userRepository.getUser();
        final dynamic loadedChildTransaction =
            await ChildTransactionRepository().getChildTransactions();
        yield TransactionLoadedState(
          loadedTransaction: loadedChildTransaction,
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
        final dynamic loadedChildTransaction =
            await childTransactionRepository.getFilteredChildTransactions(
          fromDateParts[0],
          toDateParts[0],
        );
        yield TransactionLoadedState(
          loadedTransaction: loadedChildTransaction,
          loadedUser: loadedUser,
        );
      } catch (e) {
        yield TransactionEmptyState();
      }
    }
  }
}
