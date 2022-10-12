import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  const ContactModel({
    required String id,
    required String title,
    required String role,
    required String phone,
    required String notes,
    required String mobile,
    required String lastName,
    required bool isSigner,
    required String firstName,
    required String email,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
    required bool isSynced,
  }) : super(
          title: title,
          role: role,
          phone: phone,
          notes: notes,
          mobile: mobile,
          lastName: lastName,
          isSigner: isSigner,
          id: id,
          firstName: firstName,
          email: email,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
          isSynced: isSynced,
        );

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      title: json['title'],
      phone: json['phone'],
      role: json['role'],
      notes: json['notes'],
      mobile: json['mobile'],
      lastName: json['lastName'],
      isSigner: json['isSigner'],
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
      isSynced: json['isSynced'] ?? true,
    );
  }
}
