import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String title;
  final String role;
  final String phone;
  final String notes;
  final String mobile;
  final String lastName;
  final bool isSigner;
  final String id;
  final String firstName;
  final String email;
  final String createdOn;
  final String updatedOn;
  final bool isActive;
  final bool isSynced;

  const Contact({
    required this.title,
    required this.role,
    required this.phone,
    required this.notes,
    required this.mobile,
    required this.lastName,
    required this.isSigner,
    required this.id,
    required this.firstName,
    required this.email,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
    required this.isSynced,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['phone'] = phone;
    data['role'] = role;
    data['notes'] = notes;
    data['mobile'] = mobile;
    data['lastName'] = lastName;
    data['isSigner'] = isSigner;
    data['id'] = id;
    data['firstName'] = firstName;
    data['email'] = email;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    data['isActive'] = isActive;
    data['isSynced'] = isSynced;
    return data;
  }

  @override
  List<Object?> get props => [
        title,
        role,
        phone,
        notes,
        mobile,
        lastName,
        isSigner,
        id,
        firstName,
        email,
        createdOn,
        updatedOn,
        isActive,
        isSynced,
      ];

  @override
  bool? get stringify => true;
}
