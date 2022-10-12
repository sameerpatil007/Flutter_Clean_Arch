import '../../domain/entities/panel.dart';

class PanelModel extends Panel {
  const PanelModel({
    required String id,
    required String name,
    required bool isActive,
  }) : super(
          id: id,
          name: name,
          isActive: isActive,
        );

  factory PanelModel.fromJson(Map<String, dynamic> json) {
    return PanelModel(
      id: json['id'],
      name: json['name'],
      isActive: json['isActive'],
    );
  }
}
