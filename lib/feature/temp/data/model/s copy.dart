class TransactionModel {
  final String title;
  final DateTime date;
  final double amount;
  final String type; // 'deposit' or 'withdraw'

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });
}