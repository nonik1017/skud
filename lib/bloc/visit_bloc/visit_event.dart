abstract class VisitEvent {}

class VisitLoadEvent extends VisitEvent {}

class VisitFilterButtonPressed extends VisitEvent {
  final String selectedFromDate;
  final String selectedToDate;

  VisitFilterButtonPressed({
    required this.selectedFromDate,
    required this.selectedToDate,
  });

  List<Object> get props => [selectedFromDate, selectedToDate];

  @override
  String toString() =>
      'VisitFilterButtonPressed { selectedFromDate: $selectedFromDate, selectedToDate: $selectedFromDate }';
}
