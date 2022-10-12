import 'package:equatable/equatable.dart';

import 'inspection.dart';
import 'inspection_configuration.dart';
import 'inspection_location.dart';
import 'service.dart';
import 'work_order_picture.dart';

class WorkOrder extends Equatable {
  final String name;
  final String id;
  final DateTime woDate;
  final String stock;
  final String status;
  final String state;
  final String ro;
  final int price;
  final String policy;
  final bool isReadOnly;
  final String invoiceId;
  final String internalNote;
  final String insurancePhone;
  final String insuranceEmail;
  final String insurance;
  final String claim;
  final InspectionLocation inspectionLocationData;
  final bool hasEditAccess;
  final String externalNote;
  final String department;
  final int deductible;
  final String dateOfLoss;
  final String customerId;
  final String contactId;
  final String hailMatrix;
  final String vehicleId;
  final String vin;
  final String vehicleType;
  final String year;
  final String trim;
  final String color;
  final String paintCode;
  final String model;
  final String mileage;
  final String make;
  final String licensePlate;
  final int doors;
  final String bodyClass;
  final InspectionConfiguration imageSlotData;
  final Inspection inspectionData;
  final List<WorkOrderPicture> photoList;
  final List<Service> serviceList;
  final String createdOn;
  final String updatedOn;
  final bool isActive;
  final bool isSynced;

  const WorkOrder({
    required this.name,
    required this.id,
    required this.woDate,
    required this.stock,
    required this.status,
    required this.state,
    required this.ro,
    required this.price,
    required this.policy,
    required this.isReadOnly,
    required this.invoiceId,
    required this.internalNote,
    required this.insurancePhone,
    required this.insuranceEmail,
    required this.insurance,
    required this.claim,
    required this.inspectionLocationData,
    required this.hasEditAccess,
    required this.externalNote,
    required this.department,
    required this.deductible,
    required this.dateOfLoss,
    required this.customerId,
    required this.contactId,
    required this.hailMatrix,
    required this.vehicleId,
    required this.vin,
    required this.vehicleType,
    required this.year,
    required this.trim,
    required this.color,
    required this.paintCode,
    required this.model,
    required this.mileage,
    required this.make,
    required this.licensePlate,
    required this.doors,
    required this.bodyClass,
    required this.inspectionData,
    required this.imageSlotData,
    required this.photoList,
    required this.serviceList,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
    required this.isSynced,
  });

  @override
  List<Object?> get props => [
        name,
        id,
        woDate,
        stock,
        status,
        state,
        ro,
        price,
        policy,
        isReadOnly,
        invoiceId,
        internalNote,
        insurancePhone,
        insuranceEmail,
        insurance,
        claim,
        inspectionLocationData,
        hasEditAccess,
        externalNote,
        department,
        deductible,
        dateOfLoss,
        customerId,
        contactId,
        hailMatrix,
        vehicleId,
        vin,
        vehicleType,
        year,
        trim,
        color,
        paintCode,
        model,
        mileage,
        make,
        licensePlate,
        doors,
        bodyClass,
        inspectionData,
        imageSlotData,
        photoList,
        serviceList,
        createdOn,
        updatedOn,
        isActive,
        isSynced,
      ];

  @override
  bool? get stringify => true;
}
