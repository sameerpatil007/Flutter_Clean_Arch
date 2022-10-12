import '../../domain/entities/notification.dart';

class NotificationModel extends Notification {
  const NotificationModel({
    required String id,
    required String subject,
    required String message,
    required String link,
    required bool read,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
  }) : super(
          id: id,
          subject: subject,
          message: message,
          link: link,
          read: read,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      subject: json["subject"],
      message: json["message"],
      link: json["link"],
      read: json["read"],
      createdOn: json["createdOn"],
      updatedOn: json["updatedOn"],
      isActive: json["isActive"],
    );
  }
}
