import 'package:equatable/equatable.dart';

import 'invoice_payment.dart';

class Invoice extends Equatable {
  final String status;
  final int price;
  final String po;
  final InvoicePayment paymentDetail;
  final String name;
  final bool isSyncToQuickbooks;
  final bool isReadOnly;
  final bool isPaymentPending;
  final bool isApproved;
  final DateTime invoiceDate;
  final String id;
  final String customerId;
  final String createdOn;
  final String updatedOn;
  final bool isActive;
  final bool isSynced;

  const Invoice({
    required this.status,
    required this.price,
    required this.po,
    required this.paymentDetail,
    required this.name,
    required this.isSyncToQuickbooks,
    required this.isReadOnly,
    required this.isPaymentPending,
    required this.isApproved,
    required this.invoiceDate,
    required this.id,
    required this.customerId,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
    required this.isSynced,
  });

  @override
  List<Object?> get props => [
        status,
        price,
        po,
        paymentDetail,
        name,
        isSyncToQuickbooks,
        isReadOnly,
        isPaymentPending,
        isApproved,
        invoiceDate,
        id,
        customerId,
        createdOn,
        updatedOn,
        isActive,
        isSynced,
      ];

  @override
  bool? get stringify => true;
}
