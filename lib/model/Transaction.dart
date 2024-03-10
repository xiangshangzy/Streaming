class Transaction {
  String? id = "id";
  String? title = "Alice";
  double? amount = 100.11;
  DateTime? date = DateTime.now();

  Transaction({this.title, this.amount});
}
