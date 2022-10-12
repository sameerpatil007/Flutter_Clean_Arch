import 'package:equatable/equatable.dart';

import '../../data/models/vehicle_service_model.dart';
import 'faq_section.dart';
import 'glass_static.dart';
import 'hail_matrix.dart';
import 'hail_static.dart';
import 'inspection_configuration.dart';
import 'make.dart';
import 'panel.dart';
import 'photo_slot.dart';
import 'service.dart';
import 'vehicle_panel.dart';
import 'vehicle_service_item.dart';
import 'vehicle_type.dart';
import 'video_tutorial.dart';

class AppStaticData extends Equatable {
  final List<VideoTutorial> videoTutorialList;
  final List<Make> makeModelData;
  final List<FaqSection> faqSectionList;
  final List<HailMatrix> defaultHailMatrixList;
  final InspectionConfiguration imageSlotSelectionData;
  final List<VehicleServiceModel> serviceList;
  final List<VehicleType> vehicleTypeDoorList;
  final List<Panel> panelList;
  final List<VehiclePanel> vehiclePanelList;
  final List<VehicleServiceItem> panelItemList;
  final HailStatic hailStaticData;
  final GlassStatic glassStaticData;
  final List<PhotoSlot> inspectionImageList;

  const AppStaticData({
    required this.videoTutorialList,
    required this.makeModelData,
    required this.faqSectionList,
    required this.defaultHailMatrixList,
    required this.imageSlotSelectionData,
    required this.serviceList,
    required this.vehicleTypeDoorList,
    required this.panelList,
    required this.vehiclePanelList,
    required this.panelItemList,
    required this.hailStaticData,
    required this.glassStaticData,
    required this.inspectionImageList,
  });

  @override
  List<Object?> get props => [
        videoTutorialList,
        makeModelData,
        faqSectionList,
        defaultHailMatrixList,
        imageSlotSelectionData,
        serviceList,
        vehicleTypeDoorList,
        panelList,
        vehiclePanelList,
        panelItemList,
        hailStaticData,
        glassStaticData,
        inspectionImageList,
      ];

  @override
  bool? get stringify => true;
}
