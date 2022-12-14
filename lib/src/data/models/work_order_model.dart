import '../../domain/entities/work_order.dart';
import 'inspection_configuration_model.dart';
import 'inspection_location_model.dart';
import 'inspection_model.dart';
import 'work_order_picture_model.dart';
import 'service_model.dart';

class WorkOrderModel extends WorkOrder {
  const WorkOrderModel({
    required String name,
    required String id,
    required DateTime woDate,
    required String stock,
    required String status,
    required String state,
    required String ro,
    required int price,
    required String policy,
    required bool isReadOnly,
    required String invoiceId,
    required String internalNote,
    required String insurancePhone,
    required String insuranceEmail,
    required String insurance,
    required String claim,
    required InspectionLocationModel inspectionLocationData,
    required bool hasEditAccess,
    required String externalNote,
    required String department,
    required int deductible,
    required String dateOfLoss,
    required String customerId,
    required String contactId,
    required String hailMatrix,
    required String vehicleId,
    required String vin,
    required String vehicleType,
    required String year,
    required String trim,
    required String color,
    required String paintCode,
    required String model,
    required String mileage,
    required String make,
    required String licensePlate,
    required int doors,
    required String bodyClass,
    required InspectionConfigurationModel imageSlotData,
    required InspectionModel inspectionData,
    required List<WorkOrderPictureModel> photoList,
    required List<ServiceModel> serviceList,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
    required bool isSynced,
  }) : super(
          name: name,
          id: id,
          woDate: woDate,
          stock: stock,
          status: status,
          state: state,
          ro: ro,
          price: price,
          policy: policy,
          isReadOnly: isReadOnly,
          invoiceId: invoiceId,
          internalNote: internalNote,
          insurancePhone: insurancePhone,
          insuranceEmail: insuranceEmail,
          insurance: insurance,
          claim: claim,
          inspectionLocationData: inspectionLocationData,
          hasEditAccess: hasEditAccess,
          externalNote: externalNote,
          department: department,
          deductible: deductible,
          dateOfLoss: dateOfLoss,
          customerId: customerId,
          contactId: contactId,
          hailMatrix: hailMatrix,
          vehicleId: vehicleId,
          vin: vin,
          vehicleType: vehicleType,
          year: year,
          trim: trim,
          color: color,
          paintCode: paintCode,
          model: model,
          mileage: mileage,
          make: make,
          licensePlate: licensePlate,
          doors: doors,
          bodyClass: bodyClass,
          inspectionData: inspectionData,
          imageSlotData: imageSlotData,
          photoList: photoList,
          serviceList: serviceList,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
          isSynced: isSynced,
        );

  factory WorkOrderModel.fromJson(Map<String, dynamic> json) {
    return WorkOrderModel(
      name: json['name'],
      id: json['id'],
      woDate: DateTime.parse(json['woDate']),
      stock: json['stock'],
      status: json['status'],
      state: json['state'],
      ro: json['ro'],
      price: json['price'],
      policy: json['policy'],
      isReadOnly: json['isReadOnly'],
      invoiceId: json['invoiceId'],
      internalNote: json['internalNote'],
      insurancePhone: json['insurancePhone'],
      insuranceEmail: json['insuranceEmail'],
      insurance: json['insurance'],
      claim: json['claim'],
      inspectionLocationData: json['inspectionLocationData'],
      hasEditAccess: json['hasEditAccess'],
      externalNote: json['externalNote'],
      department: json['department'],
      deductible: json['deductible'],
      dateOfLoss: json['dateOfLoss'],
      customerId: json['customerId'],
      contactId: json['contactId'],
      hailMatrix: json['hailMatrix'],
      vehicleId: json['vehicleId'],
      vin: json['vin'],
      vehicleType: json['vehicleType'],
      year: json['year'],
      trim: json['trim'],
      color: json['color'],
      paintCode: json['paintCode'],
      model: json['model'],
      mileage: json['mileage'],
      make: json['make'],
      licensePlate: json['licensePlate'],
      doors: json['doors'],
      bodyClass: json['bodyClass'],
      inspectionData: json['inspectionData'],
      imageSlotData: json['imageSlotData'],
      photoList: json['photoList'].map((x) => WorkOrderPictureModel.fromJson(x)),
      serviceList: json['serviceList'].map((x) => ServiceModel.fromJson(x)),
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
      isSynced: json['isSynced'] ?? true,
    );
  }
}
