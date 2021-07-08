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
      entryTime: transaction['creation'] == null
          ? null
          : DateTime.parse(transaction['creation']),
      status: transaction['status'],
      amount: transaction['total_amount'],
      beneficiary: transaction['beneficiary'],
      transactionCost: transaction['transaction_cost'],
      vendor: transaction['beneficiary'] != null
          ? transaction['beneficiary']['user'] != null
              ? transaction['beneficiary']['user']['full_name']
              : null
          : null,
      vendorEmail: transaction['beneficiary'] != null
          ? transaction['beneficiary']['user'] != null
              ? transaction['beneficiary']['user']['email']
              : null
          : null,
    );
  }
}
