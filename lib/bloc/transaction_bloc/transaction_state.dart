abstract class TransactionState {}

class TransactionEmptyState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionLoadedState extends TransactionState {
  dynamic loadedTransaction;
  dynamic loadedUser;

  TransactionLoadedState({
    required this.loadedTransaction,
    required this.loadedUser,
  });
}

class TransactionErrorState extends TransactionState {}
