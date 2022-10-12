import '../../domain/entities/service_commission.dart';
import 'service_technician_model.dart';

class ServiceCommissionModel extends ServiceCommission {
  const ServiceCommissionModel({
    required bool isPercentSplit,
    required List<ServiceTechnicianModel> technicianList,
  }) : super(
          isPercentSplit: isPercentSplit,
          technicianList: technicianList,
        );

  factory ServiceCommissionModel.fromJson(Map<String, dynamic> json) {
    return ServiceCommissionModel(
      isPercentSplit: json['isPercentSplit'],
      technicianList:
          json['technicianList'].map<ServiceTechnicianModel>((x) => ServiceTechnicianModel.fromJson(x)).toList(),
    );
  }
}
