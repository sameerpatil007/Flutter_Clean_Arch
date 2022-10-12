import '../../domain/entities/app_static_data.dart';
import 'faq_section_model.dart';
import 'glass_static_model.dart';
import 'hail_matrix_model.dart';
import 'hail_static_model.dart';
import 'inspection_configuration_model.dart';
import 'make_model.dart';
import 'panel_model.dart';
import 'photo_slot_model.dart';
import 'service_model.dart';
import 'vehicle_panel_model.dart';
import 'vehicle_service_item_model.dart';
import 'vehicle_service_model.dart';
import 'vehicle_type_model.dart';
import 'video_tutorial_model.dart';

class AppStaticDataModel extends AppStaticData {
  const AppStaticDataModel({
    required List<VideoTutorialModel> videoTutorialList,
    required List<MakeModel> makeModelData,
    required List<FaqSectionModel> faqSectionList,
    required List<HailMatrixModel> defaultHailMatrixList,
    required InspectionConfigurationModel imageSlotSelectionData,
    required List<VehicleServiceModel> serviceList,
    required List<VehicleTypeModel> vehicleTypeDoorList,
    required List<PanelModel> panelList,
    required List<VehiclePanelModel> vehiclePanelList,
    required List<VehicleServiceItemModel> panelItemList,
    required HailStaticModel hailStaticData,
    required GlassStaticModel glassStaticData,
    required List<PhotoSlotModel> inspectionImageList,
  }) : super(
          videoTutorialList: videoTutorialList,
          makeModelData: makeModelData,
          faqSectionList: faqSectionList,
          defaultHailMatrixList: defaultHailMatrixList,
          imageSlotSelectionData: imageSlotSelectionData,
          serviceList: serviceList,
          vehicleTypeDoorList: vehicleTypeDoorList,
          panelList: panelList,
          vehiclePanelList: vehiclePanelList,
          panelItemList: panelItemList,
          hailStaticData: hailStaticData,
          glassStaticData: glassStaticData,
          inspectionImageList: inspectionImageList,
        );

  factory AppStaticDataModel.fromJson(Map<String, dynamic> json) {
    return AppStaticDataModel(
      videoTutorialList:
          json['videoTutorialList'].map<VideoTutorialModel>((x) => VideoTutorialModel.fromJson(x)).toList(),
      makeModelData: json['makeModelData'].map<MakeModel>((x) => MakeModel.fromJson(x)).toList(),
      faqSectionList: json['faqSectionList'].map<FaqSectionModel>((x) => FaqSectionModel.fromJson(x)).toList(),
      defaultHailMatrixList:
          json['defaultHailMatrixList'].map<HailMatrixModel>((x) => HailMatrixModel.fromJson(x)).toList(),
      imageSlotSelectionData: InspectionConfigurationModel.fromJson(json['imageSlotSelectionData']),
      serviceList: json['serviceList'].map<VehicleServiceModel>((x) => VehicleServiceModel.fromJson(x)).toList(),
      vehicleTypeDoorList:
          json['vehicleTypeDoorList'].map<VehicleTypeModel>((x) => VehicleTypeModel.fromJson(x)).toList(),
      panelList: json['panelList'].map<PanelModel>((x) => PanelModel.fromJson(x)).toList(),
      vehiclePanelList: json['vehiclePanelList'].map<VehiclePanelModel>((x) => VehiclePanelModel.fromJson(x)).toList(),
      panelItemList:
          json['panelItemList'].map<VehicleServiceItemModel>((x) => VehicleServiceItemModel.fromJson(x)).toList(),
      hailStaticData: HailStaticModel.fromJson(json['hailStaticData']),
      glassStaticData: GlassStaticModel.fromJson(json['glassStaticData']),
      inspectionImageList: json['inspectionImageList'].map<PhotoSlotModel>((x) => PhotoSlotModel.fromJson(x)).toList(),
    );
  }
}
