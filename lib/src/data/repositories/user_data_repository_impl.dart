import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/resources/data_state.dart';
import '../../core/utils/constants.dart';
import '../../domain/entities/account.dart';
import '../../domain/entities/customer.dart';
import '../../domain/entities/invoice.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/notification.dart';
import '../../domain/entities/support_ticket.dart';
import '../../domain/entities/user_specific_data.dart';
import '../../domain/entities/work_order.dart';
import '../../domain/repositories/user_data_repository.dart';
import '../data_sources/local/app_preferences.dart';
import '../data_sources/local/user_dao.dart';
import '../data_sources/remote/app_api_service.dart';
import '../models/api_user_data_response_model.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  UserDataRepositoryImpl(this._vehicleHubApiService, this._appPreferences, this._userDao) {
    _initData();
  }

  final AppApiService _vehicleHubApiService;
  final AppPreferences _appPreferences;
  final UserDao _userDao;

  late StreamSubscription<UserSpecificData?> _syncableDataStream;

  final StreamController<String?> _sessionController = StreamController<String?>();

  String? _session;
  String? _userLastSync;

  void _initData() async {
    _session = await _appPreferences.readValue(key: kPrefSession) as String?;
    _userLastSync = await _appPreferences.readValue(key: kPrefUserSyncOn) as String?;
    _syncableDataStream = _userDao.unSyncData.listen(_onSyncableData);
    if (_session != null) {
      _syncUserData();
    }
    _sessionController.add(_session);
  }

  @override
  Future<void> userLogin(LoginResponse loginResponse) async {
    _session = loginResponse.sessionId;
    _sessionController.add(_session);
    await _appPreferences.writeValue(key: kPrefSession, value: _session);
    _userLastSync = '';
    await _appPreferences.writeValue(key: kPrefUserSyncOn, value: _userLastSync);

    _userDao.saveAccount(loginResponse.account!);
  }

  @override
  Stream<Account?> get account => _userDao.account;

  @override
  Stream<List<Customer>?> get customer => _userDao.customerList;

  @override
  Stream<List<WorkOrder>?> get workOrder => _userDao.workOrderList;

  @override
  Stream<List<Invoice>?> get invoice => _userDao.invoiceList;

  @override
  Stream<List<Notification>?> get notification => _userDao.notificationList;

  @override
  Stream<List<SupportTicket>?> get ticket => _userDao.supportTicketList;

  @override
  Stream<String?> get session async* {
    yield null;
    yield* _sessionController.stream;
  }

  @override
  Future<void> saveAccount(Account account) async {
    _userDao.saveAccount(account);
  }

  @override
  Future<void> saveCustomer(Customer customer) async {
    _userDao.saveCustomer(customer);
  }

  @override
  Future<void> saveWorkOrder(WorkOrder workOrder) async {
    _userDao.saveWorkOrder(workOrder);
  }

  @override
  Future<void> saveInvoice(Invoice invoice) async {
    _userDao.saveInvoice(invoice);
  }

  @override
  Future<void> saveNotification(Notification notification) async {
    _userDao.saveNotification(notification);
  }

  @override
  Future<void> logoutUser() async {
    _appPreferences.deleteValue(key: kPrefSession);
    _appPreferences.deleteValue(key: kPrefUserSyncOn);
    _userDao.deleteUserData();
    _session = null;
    _sessionController.add(_session);
  }

  void _onSyncableData(UserSpecificData? data) async {
    if (data != null) {
      try {
        DataState userDataApiResponse = await _postUserData(data);
        if (userDataApiResponse is DataSuccess && userDataApiResponse.data != null) {
          _userLastSync = userDataApiResponse.data.status.lastSyncOn;
          _appPreferences.writeValue(key: kPrefUserSyncOn, value: _userLastSync);

          _userDao.mergeUserData(userDataApiResponse.data.data);
        }
      } on DioError catch (e) {
        //Todo: Implement error handling
      }
    }
  }

  void _syncUserData() async {
    try {
      late DataState userDataApiResponse;
      // UserSpecificData? unSyncUserData = _getSyncableUserData();
      // if (unSyncUserData != null) {
      //   userDataApiResponse = await _postUserData(unSyncUserData);
      // } else {
      userDataApiResponse = await _fetchUserData();
      // }

      if (userDataApiResponse is DataSuccess) {
        _userLastSync = userDataApiResponse.data.status.lastSyncOn;
        _appPreferences.writeValue(key: kPrefUserSyncOn, value: _userLastSync);

        if (userDataApiResponse.data.data != null) {
          _userDao.mergeUserData(userDataApiResponse.data.data);
        }
      }
    } on DioError catch (e) {
      //Todo: Report error
    }
  }

  Future<DataState<ApiUserDataResponseModel?>> _fetchUserData() async {
    try {
      final HttpResponse httpResponse =
          await _vehicleHubApiService.getUserData(session: _session!, lastSync: _userLastSync!);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.status.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data);
        } else {
          return DataFailed(
            DioError(
              error: httpResponse.data.status.message,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions,
              type: DioErrorType.other,
            ),
          );
        }
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<ApiUserDataResponseModel?>> _postUserData(UserSpecificData params) async {
    try {
      final HttpResponse httpResponse = await _vehicleHubApiService.postUserData(
          userSpecificData: params, session: _session!, lastSync: _userLastSync!);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.status.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data);
        } else {
          return DataFailed(
            DioError(
              error: httpResponse.data.status.message,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions,
              type: DioErrorType.other,
            ),
          );
        }
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  void dispose() {
    _syncableDataStream.cancel();
    _sessionController.close();
  }
}
