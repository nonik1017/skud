abstract class TransactionState {}

class TransactionEmptyState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionLoadedState extends TransactionState {
  dynamic loadedTransaction;

  TransactionLoadedState({required this.loadedTransaction});
}

class TransactionErrorState extends TransactionState {}
