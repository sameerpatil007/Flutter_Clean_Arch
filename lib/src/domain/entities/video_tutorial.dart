import 'package:equatable/equatable.dart';

class VideoTutorial extends Equatable {
  final String url;
  final String title;
  final String id;
  final String description;
  final int sortOrder;
  final bool isActive;

  const VideoTutorial({
    required this.url,
    required this.title,
    required this.id,
    required this.description,
    required this.sortOrder,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        url,
        title,
        id,
        description,
        sortOrder,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
