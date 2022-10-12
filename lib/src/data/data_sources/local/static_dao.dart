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

abstract class StaticDao {
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

  Future<void> updateData(AppStaticData appStaticApiResponse);
}
