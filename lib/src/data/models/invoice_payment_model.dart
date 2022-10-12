import '../../domain/entities/invoice_payment.dart';

class InvoicePaymentModel extends InvoicePayment {
  const InvoicePaymentModel({
    required String stripePaymentId,
    required DateTime paymentDate,
    required String mode,
    required String checkNumber,
    required String checkImageUrl,
  }) : super(
          stripePaymentId: stripePaymentId,
          paymentDate: paymentDate,
          mode: mode,
          checkNumber: checkNumber,
          checkImageUrl: checkImageUrl,
        );

  factory InvoicePaymentModel.fromJson(Map<String, dynamic> json) {
    return InvoicePaymentModel(
      stripePaymentId: json['stripePaymentId'],
      paymentDate: DateTime.parse(json['paymentDate']),
      mode: json['mode'],
      checkNumber: json['checkNumber'],
      checkImageUrl: json['checkImageUrl'],
    );
  }
}
