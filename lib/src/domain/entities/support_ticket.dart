import 'package:equatable/equatable.dart';

import 'conversation.dart';

class SupportTicket extends Equatable {
  final String id;
  final String ticketNumber;
  final String status;
  final String ticketDate;
  final String title;
  final String closeReason;
  final List<Conversation> conversationList;
  final String createdOn;
  final String updatedOn;
  final bool isActive;

  const SupportTicket({
    required this.id,
    required this.ticketNumber,
    required this.status,
    required this.ticketDate,
    required this.title,
    required this.closeReason,
    required this.conversationList,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        ticketNumber,
        status,
        ticketDate,
        title,
        closeReason,
        conversationList,
        createdOn,
        updatedOn,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
