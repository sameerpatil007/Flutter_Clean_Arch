import 'package:equatable/equatable.dart';

class SubscriptionPayment extends Equatable {
  final String status;
  final DateTime paymentDate;
  final String invoiceUrl;
  final String id;
  final double amount;

  const SubscriptionPayment({
    required this.status,
    required this.paymentDate,
    required this.invoiceUrl,
    required this.id,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status']=status;
    data['paymentDate']=paymentDate;
    data['invoiceUrl']=invoiceUrl;
    data['id']=id;
    data['amount']=amount;
    return data;
  }

  @override
  List<Object?> get props => [
        status,
        paymentDate,
        invoiceUrl,
        id,
        amount,
      ];

  @override
  bool? get stringify => true;
}
