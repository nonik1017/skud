import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/transaction_bloc/transaction_event.dart';
import 'package:skud/bloc/transaction_bloc/transaction_state.dart';
import 'package:skud/repositories/repositories.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;
  // TransactionBloc({required this.transactionRepository}) : super(TransactionEmptyState());

  TransactionBloc({required this.transactionRepository})
      : super(TransactionLoadingState());

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionLoadEvent) {
      yield TransactionLoadingState();

      try {
        final dynamic loadedTransaction =
            await TransactionRepository().getTransactions();
        yield TransactionLoadedState(loadedTransaction: loadedTransaction);
      } catch (e) {
        yield TransactionEmptyState();
      }
    }

    if (event is TransactionFilterButtonPressed) {
      yield TransactionLoadingState();
      try {
        final dynamic fromDateParts = event.selectedFromDate.split(' ');
        final dynamic toDateParts = event.selectedToDate.split(' ');
        final dynamic loadedTransaction =
            await transactionRepository.getFilteredTransactions(
          fromDateParts[0],
          toDateParts[0],
        );
        yield TransactionLoadedState(loadedTransaction: loadedTransaction);
      } catch (e) {
        yield TransactionEmptyState();
      }
    }
  }
}
