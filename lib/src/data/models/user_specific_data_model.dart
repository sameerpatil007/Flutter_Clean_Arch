import '../../domain/entities/user_specific_data.dart';
import 'account_model.dart';
import 'customer_model.dart';
import 'invoice_model.dart';
import 'notification_model.dart';
import 'support_ticket_model.dart';
import 'work_order_model.dart';

class UserSpecificDataModel extends UserSpecificData {
  const UserSpecificDataModel({
    AccountModel? account,
    List<CustomerModel>? customer,
    List<WorkOrderModel>? workOrder,
    List<InvoiceModel>? invoice,
    List<NotificationModel>? notification,
    List<SupportTicketModel>? ticket,
  }) : super(
          account: account,
          customer: customer,
          workOrder: workOrder,
          invoice: invoice,
          notification: notification,
          ticket: ticket,
        );

  factory UserSpecificDataModel.fromJson(Map<String, dynamic> json) {
    return UserSpecificDataModel(
      account: AccountModel.fromJson(json['account']),
      customer: json['customer']?.map<CustomerModel>((x) => CustomerModel.fromJson(x)).toList(),
      workOrder: json['workOrder']?.map<WorkOrderModel>((x) => WorkOrderModel.fromJson(x)).toList(),
      invoice: json['invoice']?.map<InvoiceModel>((x) => InvoiceModel.fromJson(x)).toList(),
      notification: json['notification']?.map<NotificationModel>((x) => NotificationModel.fromJson(x)).toList(),
      ticket: json['ticket']?.map<SupportTicketModel>((x) => SupportTicketModel.fromJson(x)).toList(),
    );
  }
}
