import '../entities/account.dart';
import '../entities/customer.dart';
import '../entities/invoice.dart';
import '../entities/login_response.dart';
import '../entities/notification.dart';
import '../entities/support_ticket.dart';
import '../entities/work_order.dart';

abstract class UserDataRepository {
  Stream<Account?> get account;
  Stream<List<Customer>?> get customer;
  Stream<List<WorkOrder>?> get workOrder;
  Stream<List<Invoice>?> get invoice;
  Stream<List<Notification>?> get notification;
  Stream<List<SupportTicket>?> get ticket;
  Stream<String?> get session;

  Future<void> userLogin(LoginResponse loginResponse);
  Future<void> saveAccount(Account account);
  Future<void> saveCustomer(Customer customer);
  Future<void> saveWorkOrder(WorkOrder workOrder);
  Future<void> saveInvoice(Invoice invoice);
  Future<void> saveNotification(Notification notification);
  Future<void> logoutUser();
}
