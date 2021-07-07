class TransactionModel {
  final String id;
  final DateTime entryTime;
  final double amount;
  final double transactionCost;
  final String status;
  final String beneficiary;
  final String vendor;
  final String vendorEmail;

  TransactionModel(
      {this.id,
      this.entryTime,
      this.amount,
      this.transactionCost,
      this.status,
      this.beneficiary,
      this.vendor,
      this.vendorEmail});

  factory TransactionModel.fromMap(transaction) {
    return TransactionModel(
        id: transaction['name'],
        entryTime: DateTime.parse(transaction['creation']),
        status: transaction['status'],
        amount: transaction['total_amount'],
        beneficiary: transaction['beneficiary']);
  }
}
