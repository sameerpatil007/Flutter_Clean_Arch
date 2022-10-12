import 'package:equatable/equatable.dart';

class Conversation extends Equatable {
  final String id;
  final String fromName;
  final String title;
  final String description;
  final String conversationDate;
  final String conversationTime;

  const Conversation({
    required this.id,
    required this.fromName,
    required this.title,
    required this.description,
    required this.conversationDate,
    required this.conversationTime,
  });

  @override
  List<Object?> get props => [
        id,
        fromName,
        title,
        description,
        conversationDate,
        conversationTime,
      ];

  @override
  bool? get stringify => true;
}
