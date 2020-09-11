class Transaction {
  Transaction(this.accountNumber, this.value);

  final int accountNumber;
  final double value;

  @override
  String toString() {
    return 'Transaction{accountNumber: $accountNumber, value: $value}';
  }
}