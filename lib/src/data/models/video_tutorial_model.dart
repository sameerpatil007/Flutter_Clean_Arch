import '../../domain/entities/video_tutorial.dart';

class VideoTutorialModel extends VideoTutorial {
  const VideoTutorialModel({
    required String url,
    required String title,
    required String id,
    required String description,
    required int sortOrder,
    required bool isActive,
  }) : super(
          url: url,
          title: title,
          id: id,
          description: description,
          sortOrder: sortOrder,
          isActive: isActive,
        );

  factory VideoTutorialModel.fromJson(Map<String, dynamic> json) {
    return VideoTutorialModel(
      url: json['url'],
      title: json['title'],
      id: json['id'],
      description: json['description'],
      sortOrder: json['sortOrder'],
      isActive: json['isActive'],
    );
  }
}
