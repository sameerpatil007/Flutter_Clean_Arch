import '../entities/faq_section.dart';
import '../entities/glass_static.dart';
import '../entities/hail_matrix.dart';
import '../entities/hail_static.dart';
import '../entities/inspection_configuration.dart';
import '../entities/make.dart';
import '../entities/panel.dart';
import '../entities/photo_slot.dart';
import '../entities/vehicle_panel.dart';
import '../entities/vehicle_service.dart';
import '../entities/vehicle_service_item.dart';
import '../entities/vehicle_type.dart';
import '../entities/video_tutorial.dart';

abstract class StaticDataRepository {
  Future<List<VideoTutorial>> get videoTutorialList;
  Future<List<Make>> get makeList;
  Future<List<FaqSection>> get faqSectionList;
  Future<List<HailMatrix>> get defaultHailMatrixList;
  Future<InspectionConfiguration> get imageSlotSelectionData;
  Future<List<VehicleService>> get serviceList;
  Future<List<VehicleType>> get vehicleTypeDoorList;
  Future<List<Panel>> get panelList;
  Future<List<VehiclePanel>> get vehiclePanelList;
  Future<List<VehicleServiceItem>> get panelItemList;
  Future<HailStatic> get hailStaticData;
  Future<GlassStatic> get glassStaticData;
  Future<List<PhotoSlot>> get inspectionImageList;
}
