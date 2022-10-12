import 'dart:async';
import 'dart:convert';

import '../../../core/utils/constants.dart';
import '../../../domain/entities/account.dart';
import '../../../domain/entities/contact.dart';
import '../../../domain/entities/customer.dart';
import '../../../domain/entities/invoice.dart';
import '../../../domain/entities/notification.dart';
import '../../../domain/entities/support_ticket.dart';
import '../../../domain/entities/user_specific_data.dart';
import '../../../domain/entities/work_order.dart';
import '../../models/user_specific_data_model.dart';
import 'user_dao.dart';
import 'app_storage.dart';

class UserDaoImpl extends UserDao {
  UserDaoImpl(this._appStorage) {
    initData();
  }

  final AppStorage _appStorage;
  late UserSpecificData? _userSpecificData;

  final StreamController<Account?> _accountController = StreamController<Account?>();
  final StreamController<List<Customer>?> _customerListController = StreamController<List<Customer>?>();
  final StreamController<List<WorkOrder>?> _workOrderListController = StreamController<List<WorkOrder>?>();
  final StreamController<List<Invoice>?> _invoiceListController = StreamController<List<Invoice>?>();
  final StreamController<List<Notification>?> _notificationListController = StreamController<List<Notification>?>();
  final StreamController<List<SupportTicket>?> _ticketListController = StreamController<List<SupportTicket>?>();
  final StreamController<UserSpecificData?> _syncableUserDataController = StreamController<UserSpecificData?>();

  initData() async {
    _onUserDataUpdated(await _appStorage.getValue(key: kFieldUserData));
    _appStorage.watchValue(key: kFieldUserData).listen(_onUserDataUpdated);
  }

  @override
  Future<void> saveAccount(Account account) async {
    _mergedUserSpecificData(UserSpecificData(account: account));
  }

  @override
  Future<void> saveCustomer(Customer customer) async {
    _mergedUserSpecificData(UserSpecificData(customer: [customer]));
  }

  @override
  Future<void> saveWorkOrder(WorkOrder workOrder) async {
    _mergedUserSpecificData(UserSpecificData(workOrder: [workOrder]));
  }

  @override
  Future<void> saveInvoice(Invoice invoice) async {
    _mergedUserSpecificData(UserSpecificData(invoice: [invoice]));
  }

  @override
  Future<void> saveNotification(Notification notification) async {
    _mergedUserSpecificData(UserSpecificData(notification: [notification]));
  }

  @override
  Future<void> mergeUserData(UserSpecificData userSpecificData) async {
    _mergedUserSpecificData(userSpecificData, isMarkAllSync: true);
  }

  @override
  Future<void> deleteUserData() async {
    _appStorage.deleteValue(key: kFieldUserData);
  }

  @override
  Stream<UserSpecificData?> get unSyncData async* {
    yield null;
    yield* _syncableUserDataController.stream;
  }

  @override
  Stream<Account?> get account async* {
    yield _userSpecificData?.account;
    yield* _accountController.stream;
  }

  @override
  Stream<List<Customer>?> get customerList async* {
    yield _userSpecificData?.customer;
    yield* _customerListController.stream;
  }

  @override
  Stream<List<WorkOrder>?> get workOrderList async* {
    yield _userSpecificData?.workOrder;
    yield* _workOrderListController.stream;
  }

  @override
  Stream<List<Invoice>?> get invoiceList async* {
    yield _userSpecificData?.invoice;
    yield* _invoiceListController.stream;
  }

  @override
  Stream<List<Notification>?> get notificationList async* {
    yield _userSpecificData?.notification;
    yield* _notificationListController.stream;
  }

  @override
  Stream<List<SupportTicket>?> get supportTicketList async* {
    yield _userSpecificData?.ticket;
    yield* _ticketListController.stream;
  }

  void _onUserDataUpdated(event) {
    if (event != null) {
      _userSpecificData = UserSpecificDataModel.fromJson(jsonDecode(event));
    } else {
      _userSpecificData = null;
    }

    _broadcastUserData();

    _checkSyncableUserData();
  }

  void _broadcastUserData() {
    _accountController.add(_userSpecificData?.account);
    _customerListController.add(_userSpecificData?.customer);
    _workOrderListController.add(_userSpecificData?.workOrder);
    _invoiceListController.add(_userSpecificData?.invoice);
    _notificationListController.add(_userSpecificData?.notification);
    _ticketListController.add(_userSpecificData?.ticket);
  }

  void _checkSyncableUserData() {
    UserSpecificData? userSpecificDataToReturn;
    Account? accountToSync = _getSyncableAccountData();
    List<Customer>? customerToSync = _getSyncableCustomerData();
    List<WorkOrder>? workOrderToSync = _getSyncableWorkOrderData();
    List<Invoice>? invoiceToSync = _getSyncableInvoiceData();
    if (accountToSync != null || customerToSync != null || workOrderToSync != null || invoiceToSync != null) {
      UserSpecificData(
          account: accountToSync,
          customer: customerToSync,
          workOrder: workOrderToSync,
          invoice: invoiceToSync,
          notification: null,
          ticket: null);
    }
    _syncableUserDataController.add(userSpecificDataToReturn);
  }

  Account? _getSyncableAccountData() {
    Account? accountToReturn;
    if (_userSpecificData?.account != null) {
      Contact? syncableContact = _userSpecificData!.account!.user!.isSynced ? _userSpecificData?.account?.user : null;
      Customer? syncableCustomer =
          _userSpecificData!.account!.company!.isSynced ? _userSpecificData?.account?.company : null;
      if (syncableContact != null || syncableCustomer != null) {
        accountToReturn = Account(user: syncableContact, company: syncableCustomer);
      }
    }
    return accountToReturn;
  }

  List<Customer>? _getSyncableCustomerData() {
    List<Customer>? customerListToReturn;
    if (_userSpecificData?.customer != null) {
      customerListToReturn = _userSpecificData!.customer!.where((customerItem) => customerItem.isSynced).toList();
    }
    return customerListToReturn;
  }

  List<WorkOrder>? _getSyncableWorkOrderData() {
    List<WorkOrder>? workOrderListToReturn;
    if (_userSpecificData?.workOrder != null) {
      workOrderListToReturn = _userSpecificData!.workOrder!.where((workOrderItem) => workOrderItem.isSynced).toList();
    }
    return workOrderListToReturn;
  }

  List<Invoice>? _getSyncableInvoiceData() {
    List<Invoice>? invoiceListToReturn;
    if (_userSpecificData?.invoice != null) {
      invoiceListToReturn = _userSpecificData!.invoice!.where((invoiceItem) => invoiceItem.isSynced).toList();
    }
    return invoiceListToReturn;
  }

  Future<void> _mergedUserSpecificData(UserSpecificData userDataApiResponse, {bool isMarkAllSync = false}) async {
    UserSpecificData userDataToUpdate = UserSpecificData(
      account: _getMergedAccount(
        previous: _userSpecificData?.account,
        current: userDataApiResponse.account,
        isMarkAllSync: isMarkAllSync,
      ),
      customer: _getMergedCustomerList(
        previous: _userSpecificData?.customer,
        current: userDataApiResponse.customer,
        isMarkAllSync: isMarkAllSync,
      ),
      workOrder: _getMergedWorkOrderList(
        previous: _userSpecificData?.workOrder,
        current: userDataApiResponse.workOrder,
        isMarkAllSync: isMarkAllSync,
      ),
      invoice: _getMergedInvoiceList(
        previous: _userSpecificData?.invoice,
        current: userDataApiResponse.invoice,
        isMarkAllSync: isMarkAllSync,
      ),
      notification: _getMergedNotificationList(
        previous: _userSpecificData?.notification,
        current: userDataApiResponse.notification,
        isMarkAllSync: isMarkAllSync,
      ),
      ticket: _getMergedSupportTicketList(
        previous: _userSpecificData?.ticket,
        current: userDataApiResponse.ticket,
        isMarkAllSync: isMarkAllSync,
      ),
    );
    _appStorage.putValue(key: kFieldUserData, value: jsonEncode(userDataToUpdate));
  }

  Account? _getMergedAccount({Account? previous, Account? current, bool isMarkAllSync = false}) {
    Account? accountToUpdate = previous ??= current;
    if (current != null) {
      accountToUpdate = current;
    }
    return accountToUpdate;
  }

  List<Customer>? _getMergedCustomerList(
      {List<Customer>? previous, List<Customer>? current, bool isMarkAllSync = false}) {
    List<Customer> customerListToUpdate = previous ??= [];
    if (current != null) {
      for (var customerItem in current) {
        customerListToUpdate.removeWhere((itemToRemove) => customerItem.id == itemToRemove.id);
        customerListToUpdate.add(customerItem);
      }
    }
    return customerListToUpdate;
  }

  List<WorkOrder>? _getMergedWorkOrderList(
      {List<WorkOrder>? previous, List<WorkOrder>? current, bool isMarkAllSync = false}) {
    List<WorkOrder>? workOrderListToUpdate = previous ??= [];
    if (current != null) {
      for (var workOrderItem in current) {
        workOrderListToUpdate.removeWhere((itemToRemove) => workOrderItem.id == itemToRemove.id);
        workOrderListToUpdate.add(workOrderItem);
      }
    }
    return workOrderListToUpdate;
  }

  List<Invoice>? _getMergedInvoiceList({List<Invoice>? previous, List<Invoice>? current, bool isMarkAllSync = false}) {
    List<Invoice>? invoiceListToUpdate = previous ??= [];
    if (current != null) {
      for (var invoiceItem in current) {
        invoiceListToUpdate.removeWhere((itemToRemove) => invoiceItem.id == itemToRemove.id);
        invoiceListToUpdate.add(invoiceItem);
      }
    }
    return invoiceListToUpdate;
  }

  List<Notification>? _getMergedNotificationList(
      {List<Notification>? previous, List<Notification>? current, bool isMarkAllSync = false}) {
    List<Notification>? notificationListToUpdate = previous ??= [];
    if (current != null) {
      for (var notificationItem in current) {
        notificationListToUpdate.removeWhere((itemToRemove) => notificationItem.id == itemToRemove.id);
        notificationListToUpdate.add(notificationItem);
      }
    }
    return notificationListToUpdate;
  }

  List<SupportTicket>? _getMergedSupportTicketList(
      {List<SupportTicket>? previous, List<SupportTicket>? current, bool isMarkAllSync = false}) {
    List<SupportTicket>? supportTicketListToUpdate = previous ??= [];
    if (current != null) {
      for (var supportTicketItem in current) {
        supportTicketListToUpdate.removeWhere((itemToRemove) => supportTicketItem.id == itemToRemove.id);
        supportTicketListToUpdate.add(supportTicketItem);
      }
    }
    return supportTicketListToUpdate;
  }

  void dispose() {
    _accountController.close();
    _customerListController.close();
    _workOrderListController.close();
    _invoiceListController.close();
    _notificationListController.close();
    _ticketListController.close();
  }
}
