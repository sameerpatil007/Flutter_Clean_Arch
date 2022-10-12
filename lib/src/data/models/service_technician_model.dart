import '../../domain/entities/service_technician.dart';

class ServiceTechnicianModel extends ServiceTechnician {
  const ServiceTechnicianModel({
    required int splitValue,
    required String id,
  }) : super(
          splitValue: splitValue,
          id: id,
        );

  factory ServiceTechnicianModel.fromJson(Map<String, dynamic> json) {
    return ServiceTechnicianModel(
      splitValue: json['splitValue'],
      id: json['id'],
    );
  }
}
