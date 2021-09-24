class Provider {
  static String mainUrl = "https://api.skud.codetau.com/api";
  var userUrl = '$mainUrl/v1/auth/user';
  var visitUrl = '$mainUrl/v1/visits?page_size=9999999&page=1&auth=1';
  var childVisitUrl = '$mainUrl/v1/visits?page_size=9999999&page=1';
  var transactionUrl = '$mainUrl/v1/transactions?auth=1&page=1';
  var childTransactionUrl = '$mainUrl/v1/transactions?my_children=1&page=1';
  var parentsUrl = '$mainUrl/v1/users?my_parents=1';

  dynamic filterVisitUrl(
    selectedFromDate,
    selectedToDate,
  ) =>
      '$mainUrl/v1/visits?page_size=9999999&auth=1&from_date=$selectedFromDate&to_date=$selectedToDate';

  dynamic filterChildVisitUrl(
    selectedFromDate,
    selectedToDate,
  ) =>
      '$mainUrl/v1/visits?page_size=9999999&from_date=$selectedFromDate&to_date=$selectedToDate';

  dynamic filterTransactionUrl(
    selectedFromDate,
    selectedToDate,
  ) =>
      '$mainUrl/v1/transactions?page_size=9999999&auth=1&from_date=$selectedFromDate&to_date=$selectedToDate';

  dynamic filterChildTransactionUrl(
    selectedFromDate,
    selectedToDate,
  ) =>
      '$mainUrl/v1/transactions?page_size=9999999&my_children=1&from_date=$selectedFromDate&to_date=$selectedToDate';
}
