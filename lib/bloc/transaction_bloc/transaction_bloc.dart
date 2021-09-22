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
  }
}
