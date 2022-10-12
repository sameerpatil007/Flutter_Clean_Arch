import '../../domain/entities/conversation.dart';

class ConversationModel extends Conversation {
  const ConversationModel({
    required String id,
    required String fromName,
    required String title,
    required String description,
    required String conversationDate,
    required String conversationTime,
  }) : super(
          id: id,
          fromName: fromName,
          title: title,
          description: description,
          conversationDate: conversationDate,
          conversationTime: conversationTime,
        );

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'],
      fromName: json['fromName'],
      title: json['title'],
      description: json['description'],
      conversationDate: json['conversationDate'],
      conversationTime: json['conversationTime'],
    );
  }
}
