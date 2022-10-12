import 'package:equatable/equatable.dart';

class FaqAnswer extends Equatable {
  final String title;
  final String id;
  // final String url;
  final String description;
  final int sortOrder;
  final bool isActive;

  const FaqAnswer({
    required this.title,
    required this.id,
    // required this.url,
    required this.description,
    required this.sortOrder,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        title,
        id,
        // url,
        description,
        sortOrder,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
