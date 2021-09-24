abstract class TransactionEvent {}

class TransactionLoadEvent extends TransactionEvent {}

class TransactionFilterButtonPressed extends TransactionEvent {
  final String selectedFromDate;
  final String selectedToDate;

  TransactionFilterButtonPressed({
    required this.selectedFromDate,
    required this.selectedToDate,
  });

  @override
  List<Object> get props => [selectedFromDate, selectedToDate];

  @override
  String toString() =>
      'TransactionFilterButtonPressed { selectedFromDate: $selectedFromDate, selectedToDate: $selectedFromDate }';
}
