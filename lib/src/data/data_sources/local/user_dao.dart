import '../../../domain/entities/account.dart';
import '../../../domain/entities/customer.dart';
import '../../../domain/entities/invoice.dart';
import '../../../domain/entities/notification.dart';
import '../../../domain/entities/support_ticket.dart';
import '../../../domain/entities/user_specific_data.dart';
import '../../../domain/entities/work_order.dart';

abstract class UserDao {
  Stream<Account?> get account;
  Stream<List<Customer>?> get customerList;
  Stream<List<WorkOrder>?> get workOrderList;
  Stream<List<Invoice>?> get invoiceList;
  Stream<List<Notification>?> get notificationList;
  Stream<List<SupportTicket>?> get supportTicketList;

  Stream<UserSpecificData?> get unSyncData;

  Future<void> saveAccount(Account account);
  Future<void> saveCustomer(Customer customer);
  Future<void> saveWorkOrder(WorkOrder workOrder);
  Future<void> saveInvoice(Invoice invoice);
  Future<void> saveNotification(Notification notification);

  Future<void> mergeUserData(UserSpecificData userSpecificData);

  Future<void> deleteUserData();
}
