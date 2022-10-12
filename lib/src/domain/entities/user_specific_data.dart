import 'package:equatable/equatable.dart';

import 'account.dart';
import 'customer.dart';
import 'invoice.dart';
import 'notification.dart';
import 'support_ticket.dart';
import 'work_order.dart';

class UserSpecificData extends Equatable {
  final Account? account;
  final List<Customer>? customer;
  final List<WorkOrder>? workOrder;
  final List<Invoice>? invoice;
  final List<Notification>? notification;
  final List<SupportTicket>? ticket;

  const UserSpecificData({
    this.account,
    this.customer,
    this.workOrder,
    this.invoice,
    this.notification,
    this.ticket,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account'] = account?.toJson();
    data['customer'] = customer?.map((x) => x.toJson()).toList();
    // data['workOrder'] = workOrder?.map((x) => x.toJson()).toList();
    // data['invoice'] = invoice?.map((x) => x.toJson()).toList();
    // data['notification'] = notification?.map((x) => x.toJson()).toList();
    // data['ticket'] = ticket?.map((x) => x.toJson()).toList();

    return data;
  }

  @override
  List<Object?> get props => [
        account,
        customer,
        workOrder,
        invoice,
        notification,
        ticket,
      ];

  @override
  bool? get stringify => true;
}
