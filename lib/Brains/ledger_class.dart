class Ledger{
  String transactionId;
  String transactionDate;
  String individual_id;
  String descriptionMsg;
  String postRef;
  String debitAmount;
  String creditAmount;
  String changedAt;
  String changedBy;

  Ledger({this.transactionId,this.transactionDate,this.individual_id,this.descriptionMsg,this.postRef,this.debitAmount,this.creditAmount,this.changedAt,this.changedBy});

  factory Ledger.fromJson(Map<String, dynamic> json) {
    return Ledger(
      transactionId: json['transaction_id'] as String,
      transactionDate: json['transaction_date'] as String,
      individual_id: json['individual_id'] as String,
      descriptionMsg: json['description_msg'] as String,
      postRef: json['post_ref'] as String,
      debitAmount: json['debit_amount'] as String,
      creditAmount: json['credit_amount'] as String,
      changedAt: json['changed_at'] as String,
      changedBy: json['changed_by'] as String
    );
  }
}