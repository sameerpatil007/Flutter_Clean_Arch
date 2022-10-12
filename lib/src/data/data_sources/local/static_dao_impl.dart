import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/entities/app_static_data.dart';
import '../../../domain/entities/faq_section.dart';
import '../../../domain/entities/glass_static.dart';
import '../../../domain/entities/hail_matrix.dart';
import '../../../domain/entities/hail_static.dart';
import '../../../domain/entities/inspection_configuration.dart';
import '../../../domain/entities/make.dart';
import '../../../domain/entities/panel.dart';
import '../../../domain/entities/photo_slot.dart';
import '../../../domain/entities/vehicle_panel.dart';
import '../../../domain/entities/vehicle_service.dart';
import '../../../domain/entities/vehicle_service_item.dart';
import '../../../domain/entities/vehicle_type.dart';
import '../../../domain/entities/video_tutorial.dart';
import '../../models/app_static_data_model.dart';
import 'app_storage.dart';
import 'static_dao.dart';

class StaticDaoImpl extends StaticDao {
  StaticDaoImpl(this._appStorage) {
    initData();
  }

  late AppStaticData _appStaticData;
  final AppStorage _appStorage;

  void initData() async {
    String? staticDataString = await _appStorage.getValue(key: kFieldStaticData);
    if (staticDataString == null) {
      staticDataString = await _parseStaticJsonFromAssets();
      _appStorage.putValue(key: kFieldStaticData, value: staticDataString);
    }
    _appStaticData = AppStaticDataModel.fromJson(jsonDecode(staticDataString));
  }

  @override
  Future<List<HailMatrix>> get defaultHailMatrixList async => _appStaticData.defaultHailMatrixList;

  @override
  Future<List<FaqSection>> get faqSectionList async => _appStaticData.faqSectionList;

  @override
  Future<GlassStatic> get glassStaticData async => _appStaticData.glassStaticData;

  @override
  Future<HailStatic> get hailStaticData async => _appStaticData.hailStaticData;

  @override
  Future<InspectionConfiguration> get imageSlotSelectionData async => _appStaticData.imageSlotSelectionData;

  @override
  Future<List<PhotoSlot>> get inspectionImageList async => _appStaticData.inspectionImageList;

  @override
  Future<List<Make>> get makeList async => _appStaticData.makeModelData;

  @override
  Future<List<VehicleServiceItem>> get panelItemList async => _appStaticData.panelItemList;

  @override
  Future<List<Panel>> get panelList async => _appStaticData.panelList;

  @override
  Future<List<VehicleService>> get serviceList async => _appStaticData.serviceList;

  @override
  Future<List<VehiclePanel>> get vehiclePanelList async => _appStaticData.vehiclePanelList;

  @override
  Future<List<VehicleType>> get vehicleTypeDoorList async => _appStaticData.vehicleTypeDoorList;

  @override
  Future<List<VideoTutorial>> get videoTutorialList async => _appStaticData.videoTutorialList;

  @override
  Future<void> updateData(AppStaticData appStaticApiResponse) async {
    //Todo: Implement static data integration
  }

  Future<String> _parseStaticJsonFromAssets() async {
    return await rootBundle.loadString(kDefaultStaticDataPath);
  }
}
