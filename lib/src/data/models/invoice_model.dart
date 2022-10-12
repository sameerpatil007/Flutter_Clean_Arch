import '../../domain/entities/invoice.dart';
import 'invoice_payment_model.dart';

class InvoiceModel extends Invoice {
  const InvoiceModel({
    required String status,
    required int price,
    required String po,
    required InvoicePaymentModel paymentDetail,
    required String name,
    required bool isSyncToQuickbooks,
    required bool isReadOnly,
    required bool isPaymentPending,
    required bool isApproved,
    required DateTime invoiceDate,
    required String id,
    required String customerId,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
    required bool isSynced,
  }) : super(
          status: status,
          price: price,
          po: po,
          paymentDetail: paymentDetail,
          name: name,
          isSyncToQuickbooks: isSyncToQuickbooks,
          isReadOnly: isReadOnly,
          isPaymentPending: isPaymentPending,
          isApproved: isApproved,
          invoiceDate: invoiceDate,
          id: id,
          customerId: customerId,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
          isSynced: isSynced,
        );

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      status: json['status'],
      price: json['price'],
      po: json['po'],
      paymentDetail: json['paymentDetail'],
      name: json['name'],
      isSyncToQuickbooks: json['isSyncToQuickbooks'],
      isReadOnly: json['isReadOnly'],
      isPaymentPending: json['isPaymentPending'],
      isApproved: json['isApproved'],
      invoiceDate: DateTime.parse(json['invoiceDate']),
      id: json['id'],
      customerId: json['customerId'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
      isSynced: json['isSynced'] ?? true,
    );
  }
}
