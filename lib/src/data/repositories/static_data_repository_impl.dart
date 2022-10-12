import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/resources/data_state.dart';
import '../../core/utils/constants.dart';
import '../../domain/entities/faq_section.dart';
import '../../domain/entities/glass_static.dart';
import '../../domain/entities/hail_matrix.dart';
import '../../domain/entities/hail_static.dart';
import '../../domain/entities/inspection_configuration.dart';
import '../../domain/entities/make.dart';
import '../../domain/entities/panel.dart';
import '../../domain/entities/photo_slot.dart';
import '../../domain/entities/vehicle_panel.dart';
import '../../domain/entities/vehicle_service.dart';
import '../../domain/entities/vehicle_service_item.dart';
import '../../domain/entities/vehicle_type.dart';
import '../../domain/entities/video_tutorial.dart';
import '../../domain/repositories/static_data_repository.dart';
import '../data_sources/local/app_preferences.dart';
import '../data_sources/local/static_dao.dart';
import '../data_sources/remote/app_api_service.dart';
import '../models/api_app_static_response_model.dart';

class StaticDataRepositoryImpl implements StaticDataRepository {
  StaticDataRepositoryImpl(this._vehicleHubApiService, this._staticDao, this._appPreferences) {
    _initData();
  }

  String? _staticLastSync;
  final AppApiService _vehicleHubApiService;
  final StaticDao _staticDao;
  final AppPreferences _appPreferences;

  void _initData() async {
    _staticLastSync = await _appPreferences.readValue(key: kPrefStaticSyncOn) as String? ?? kDefaultStaticSyncOn;
    try {
      DataState staticApiResponse = await _fetchStaticData();
      if (staticApiResponse is DataSuccess) {
        _staticLastSync = staticApiResponse.data.status.lastSyncOn;
        _appPreferences.writeValue(key: kPrefStaticSyncOn, value: _staticLastSync);
        if(staticApiResponse.data.data != null) {
          _staticDao.updateData(staticApiResponse.data.data);
        }
      }
    } on DioError catch (e) {
      //Todo: Report error
    }
  }

  @override
  Future<List<HailMatrix>> get defaultHailMatrixList async => _staticDao.defaultHailMatrixList;

  @override
  Future<List<FaqSection>> get faqSectionList async => _staticDao.faqSectionList;

  @override
  Future<GlassStatic> get glassStaticData async => _staticDao.glassStaticData;

  @override
  Future<HailStatic> get hailStaticData async => _staticDao.hailStaticData;

  @override
  Future<InspectionConfiguration> get imageSlotSelectionData async => _staticDao.imageSlotSelectionData;

  @override
  Future<List<PhotoSlot>> get inspectionImageList async => _staticDao.inspectionImageList;

  @override
  Future<List<Make>> get makeList async => _staticDao.makeList;

  @override
  Future<List<VehicleServiceItem>> get panelItemList async => _staticDao.panelItemList;

  @override
  Future<List<Panel>> get panelList async => _staticDao.panelList;

  @override
  Future<List<VehicleService>> get serviceList async => _staticDao.serviceList;

  @override
  Future<List<VehiclePanel>> get vehiclePanelList async => _staticDao.vehiclePanelList;

  @override
  Future<List<VehicleType>> get vehicleTypeDoorList async => _staticDao.vehicleTypeDoorList;

  @override
  Future<List<VideoTutorial>> get videoTutorialList async => _staticDao.videoTutorialList;

  Future<DataState<ApiAppStaticDataResponseModel?>> _fetchStaticData() async {
    try {
      final HttpResponse httpResponse = await _vehicleHubApiService.getStaticData(lastSync: _staticLastSync!);

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
}
