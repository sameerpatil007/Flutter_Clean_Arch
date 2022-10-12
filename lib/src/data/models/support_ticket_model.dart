import '../../domain/entities/support_ticket.dart';
import 'conversation_model.dart';

class SupportTicketModel extends SupportTicket {
  const SupportTicketModel({
    required String id,
    required String ticketNumber,
    required String status,
    required String ticketDate,
    required String title,
    required String closeReason,
    required List<ConversationModel> conversationList,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
  }) : super(
          id: id,
          ticketNumber: ticketNumber,
          status: status,
          ticketDate: ticketDate,
          title: title,
          closeReason: closeReason,
          conversationList: conversationList,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
        );

  factory SupportTicketModel.fromJson(Map<String, dynamic> json) {
    return SupportTicketModel(
      id: json['id'],
      ticketNumber: json['ticketNumber'],
      status: json['status'],
      ticketDate: json['ticketDate'],
      title: json['title'],
      closeReason: json['closeReason'],
      conversationList: json['conversationList'].map((x) => ConversationModel.fromJson(x)),
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
    );
  }
}
