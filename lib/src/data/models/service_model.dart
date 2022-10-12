import '../../domain/entities/service.dart';
import 'service_commission_model.dart';
import 'service_panel_model.dart';

class ServiceModel extends Service {
  const ServiceModel({
    required int pricingMode,
    required int totalPrice,
    required int totalHours,
    required int laborRate,
    required ServiceCommissionModel technicianData,
    required List<ServicePanelModel> panelList,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
  }) : super(
          pricingMode: pricingMode,
          totalPrice: totalPrice,
          totalHours: totalHours,
          laborRate: laborRate,
          technicianData: technicianData,
          panelList: panelList,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
        );

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      pricingMode: json['pricingMode'],
      totalPrice: json['totalPrice'],
      totalHours: json['totalHours'],
      laborRate: json['laborRate'],
      technicianData: json['technicianData'],
      panelList: json['panelList'].map<ServicePanelModel>((x) => ServicePanelModel.fromJson(x)).toList(),
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
    );
  }
}
