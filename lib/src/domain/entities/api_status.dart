import 'package:equatable/equatable.dart';

class ApiStatus extends Equatable {
  final int statusCode;
  final String title;
  final String message;
  final String lastSyncOn;

  const ApiStatus({
    required this.statusCode,
    required this.title,
    required this.message,
    required this.lastSyncOn,
  });

  @override
  List<Object?> get props => [
        statusCode,
        title,
        message,
        lastSyncOn,
      ];

  @override
  bool? get stringify => true;
}
