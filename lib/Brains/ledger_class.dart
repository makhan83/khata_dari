
class Ledger{
  String? transactionId;
  String? transactionDate;
  String? individual_id;
  String? descriptionMsg;
  String? postRef;
  String? debitAmount;
  String? creditAmount;
  String? changedAt;
  String? changedBy;
  String? balance;

  Ledger({this.transactionId,this.transactionDate,this.individual_id,this.descriptionMsg,this.postRef,required this.debitAmount,this.creditAmount,this.changedAt,this.changedBy,this.balance});

  factory Ledger.fromJson(Map<String, dynamic> json) {
    return Ledger(
      transactionId: json['transaction_id'] as String?,
      transactionDate: json['transaction_date'] as String?,
      individual_id: json['individual_id'] as String?,
      descriptionMsg: json['description_msg'] as String?,
      postRef: json['post_ref'] as String?,
      //debitAmount: json['debit_amount'] == null ? null : NumberFormat.simpleCurrency().format((json['debit_amount'])),
      //debitAmount: json['debit_amount'] == null ? null : NumberFormat.currency(locale: 'en-IN', customPattern: '\u00a4 ##,###').format(int.parse(json['debit_amount'])),
      debitAmount: json['debit_amount'] as String?,
      creditAmount: json['credit_amount'] as String?,
      changedAt: json['changed_at'] as String?,
      changedBy: json['changed_by'] as String?,
      balance: json['balance'] as String?,
    );
  }
}

