import '../../domain/entities/subscription_payment.dart';

class SubscriptionPaymentModel extends SubscriptionPayment {
  const SubscriptionPaymentModel({
    required String status,
    required DateTime paymentDate,
    required String invoiceUrl,
    required String id,
    required double amount,
  }) : super(
          status: status,
          paymentDate: paymentDate,
          invoiceUrl: invoiceUrl,
          id: id,
          amount: amount,
        );

  factory SubscriptionPaymentModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPaymentModel(
      status: json['status'],
      paymentDate: DateTime.parse(json['paymentDate']),
      invoiceUrl: json['invoiceURL'],
      id: json['id'],
      amount: json['amount'],
    );
  }
}
