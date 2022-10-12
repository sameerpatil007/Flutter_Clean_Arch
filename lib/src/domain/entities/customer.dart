import 'package:equatable/equatable.dart';

import 'contact.dart';
import 'hail_matrix.dart';

class Customer extends Equatable {
  final String street;
  final String state;
  final String selectedHailMatrix;
  final String postalCode;
  final String phone;
  final String name;
  final String id;
  final String email;
  final List<HailMatrix> customHailMatrixList;
  final String country;
  final List<Contact> contacts;
  final String city;
  final String createdOn;
  final String updatedOn;
  final bool isActive;
  final bool isQuickbooksConfigured;
  final bool isStripeConnectConfigured;
  final bool isSynced;

  const Customer({
    required this.street,
    required this.state,
    required this.selectedHailMatrix,
    required this.postalCode,
    required this.phone,
    required this.name,
    required this.id,
    required this.email,
    required this.customHailMatrixList,
    required this.country,
    required this.contacts,
    required this.city,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
    required this.isStripeConnectConfigured,
    required this.isQuickbooksConfigured,
    required this.isSynced,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['state'] = state;
    data['selectedHailMatrix'] = selectedHailMatrix;
    data['postalCode'] = postalCode;
    data['phone'] = phone;
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    data['customHailMatrixList'] = customHailMatrixList.map((x) => x.toJson()).toList();
    data['country'] = country;
    data['contacts'] = contacts.map((x) => x.toJson()).toList();
    data['city'] = city;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    data['isActive'] = isActive;
    data['isStripeConnectConfigured'] = isStripeConnectConfigured;
    data['isQuickbooksConfigured'] = isQuickbooksConfigured;
    data['isSynced'] = isSynced;
    return data;
  }

  @override
  List<Object?> get props => [
        street,
        state,
        selectedHailMatrix,
        postalCode,
        phone,
        name,
        id,
        email,
        customHailMatrixList,
        country,
        contacts,
        city,
        createdOn,
        updatedOn,
        isStripeConnectConfigured,
        isActive,
        isQuickbooksConfigured,
        isSynced,
      ];

  @override
  bool? get stringify => true;
}
