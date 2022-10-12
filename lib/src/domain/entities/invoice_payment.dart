import 'package:equatable/equatable.dart';

class InvoicePayment extends Equatable {
  final String stripePaymentId;
  final DateTime paymentDate;
  final String mode;
  final String checkNumber;
  final String checkImageUrl;

  const InvoicePayment({
    required this.stripePaymentId,
    required this.paymentDate,
    required this.mode,
    required this.checkNumber,
    required this.checkImageUrl,
  });

  @override
  List<Object?> get props => [
        stripePaymentId,
        paymentDate,
        mode,
        checkNumber,
        checkImageUrl,
      ];

  @override
  bool? get stringify => true;
}
