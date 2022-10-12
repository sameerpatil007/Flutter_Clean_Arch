import '../../domain/entities/customer.dart';
import 'contact_model.dart';
import 'hail_matrix_model.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required String street,
    required String state,
    required String selectedHailMatrix,
    required String postalCode,
    required String phone,
    required String name,
    required String id,
    required String email,
    required List<HailMatrixModel> customHailMatrixList,
    required String country,
    required List<ContactModel> contacts,
    required String city,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
    required bool isStripeConnectConfigured,
    required bool isQuickbooksConfigured,
    required bool isSynced,
  }) : super(
          street: street,
          state: state,
          selectedHailMatrix: selectedHailMatrix,
          postalCode: postalCode,
          phone: phone,
          name: name,
          id: id,
          email: email,
          customHailMatrixList: customHailMatrixList,
          country: country,
          contacts: contacts,
          city: city,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
          isStripeConnectConfigured: isStripeConnectConfigured,
          isQuickbooksConfigured: isQuickbooksConfigured,
          isSynced: isSynced,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      street: json['street'],
      state: json['state'],
      selectedHailMatrix: json['selectedHailMatrix'],
      postalCode: json['postalCode'],
      phone: json['phone'],
      name: json['name'],
      id: json['id'],
      email: json['email'],
      customHailMatrixList: json['customHailMatrixList'].map<HailMatrixModel>((x) => HailMatrixModel.fromJson(x)).toList(),
      country: json['country'],
      contacts: json['contacts'].map<ContactModel>((x) => ContactModel.fromJson(x)).toList(),
      city: json['city'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
      isStripeConnectConfigured: json['isStripeConnectConfigured'],
      isQuickbooksConfigured: json['isQuickbooksConfigured'],
      isSynced: json['isSynced'] ?? true,
    );
  }
}
