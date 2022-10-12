import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String id;
  final String subject;
  final String message;
  final String link;
  final bool read;
  final String createdOn;
  final String updatedOn;
  final bool isActive;

  const Notification({
    required this.id,
    required this.subject,
    required this.message,
    required this.link,
    required this.read,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        subject,
        message,
        link,
        read,
        createdOn,
        updatedOn,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
